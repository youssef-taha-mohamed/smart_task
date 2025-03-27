import 'package:flutter/material.dart';
import 'package:smart/core/styles/colors.dart';
import '../../../../share/widgets/main_text.dart';
import '../cubit/create_fatoura_cubit.dart';
import 'drop_down_item.dart';
import 'price_and_quantity.dart';

class CardItemWidget extends StatefulWidget {
  final FatouraItem item;
  final CreateFatouraCubit cubit;

  const CardItemWidget({
    super.key,
    required this.item,
    required this.cubit,
  });

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  // Values for controlling the slide behavior
  double _slideValue = 0.0;
  bool _showRightAction = false;
  bool _showLeftAction = false;
  final double _maxSlideDistance = 20.0;

  // Control dropdown expansion state
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main card with swipe actions
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            setState(() {
              // Calculate new slide value
              _slideValue += details.delta.dx;

              // Clamp the slide value to prevent sliding too far
              if (_slideValue > _maxSlideDistance) {
                _slideValue = _maxSlideDistance;
              } else if (_slideValue < -_maxSlideDistance) {
                _slideValue = -_maxSlideDistance;
              }

              // Show actions based on slide direction
              _showRightAction = _slideValue > 40;
              _showLeftAction = _slideValue < -40;
            });
          },
          onHorizontalDragEnd: (details) {
            // Keep the slide position as it is - don't reset
            if (_slideValue.abs() < 10) {
              setState(() {
                _slideValue = 0.0;
                _showRightAction = false;
                _showLeftAction = false;
              });
            } else if (_slideValue > 0) {
              // Snap to right action position
              setState(() {
                _slideValue = _maxSlideDistance;
                _showRightAction = true;
              });
            } else if (_slideValue < 0) {
              // Snap to left action position
              setState(() {
                _slideValue = -_maxSlideDistance;
                _showLeftAction = true;
              });
            }
          },
          onTap: () {
            // Reset position when tapping the card
            if (_showRightAction || _showLeftAction) {
              setState(() {
                _slideValue = 0.0;
                _showRightAction = false;
                _showLeftAction = false;
              });
            }
          },
          child: Stack(
            children: [
              // Main card content with swipe actions
              Transform.translate(
                offset: Offset(_slideValue, 0),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // Left delete action (red)
                      if (_showLeftAction)
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: _maxSlideDistance + 50,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                spacing: 4,
                                children: [
                                  MainText(
                                    'المزيد',
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Container(
                                    width: _maxSlideDistance + 10,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF2196F3),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Icon(Icons.edit_outlined,
                                        color: Colors.white, size: 24),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      // Main content
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.grey100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            spacing: 16,
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: MainText(
                                      widget.item.quantity.toString(),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _isExpanded = !_isExpanded;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 12.0),
                                              child: MainText(
                                                widget.item.name,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: IconButton(
                                                icon: Icon(_isExpanded
                                                    ? Icons.keyboard_arrow_up
                                                    : Icons
                                                        .keyboard_arrow_down),
                                                onPressed: () {
                                                  setState(() {
                                                    _isExpanded = !_isExpanded;
                                                  });
                                                },
                                                padding: EdgeInsets.all(0),
                                                constraints: BoxConstraints(
                                                  minWidth: 36,
                                                  minHeight: 36,
                                                ),
                                                iconSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Card price and quantity controls
                              PriceAndQuantityWidget(
                                item: widget.item,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right more action (blue + gray)
                      if (_showRightAction)
                        Container(
                          width: _maxSlideDistance + 15,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Dropdown content (expands in place below the card)
        if (_isExpanded) DropDownItemWidget(),
      ],
    );
  }
}
