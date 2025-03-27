import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:smart/core/styles/colors.dart';
import '../../../../share/widgets/main_text.dart';
import '../../data/drop_down_model.dart';
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
  double _slideValue = 0.0;
  bool _showRightAction = false;
  bool _showLeftAction = false;
  final double _maxSlideDistance = 20.0;

  // Control dropdown expansion state
  bool _isExpanded = false;

  bool selectedValue = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            setState(() {
              _slideValue += details.delta.dx;

              if (_slideValue > _maxSlideDistance) {
                _slideValue = _maxSlideDistance;
              } else if (_slideValue < -_maxSlideDistance) {
                _slideValue = -_maxSlideDistance;
              }

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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 12,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
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
                                    // child: Container(
                                    //   height: 50,
                                    //   decoration: BoxDecoration(
                                    //     color: AppColors.white,
                                    //     borderRadius: BorderRadius.circular(8),
                                    //   ),
                                    //   child: DropdownButtonHideUnderline(
                                    //     child: DropdownButton2<DropDownModel>(
                                    //       isExpanded: true,
                                    //
                                    //       hint: Row(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment
                                    //                 .spaceBetween,
                                    //         children: [
                                    //           Padding(
                                    //             padding:
                                    //                 const EdgeInsets.only(
                                    //                     right: 12.0),
                                    //             child: MainText(
                                    //               widget.item.name,
                                    //               fontWeight: FontWeight.w400,
                                    //               fontSize: 12,
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //       items: dropDownList
                                    //           .map((e) => DropdownMenuItem<
                                    //                   DropDownModel>(
                                    //                 value: e,
                                    //                 alignment: Alignment.center,
                                    //                 child: ListTile(
                                    //                   contentPadding:
                                    //                       EdgeInsets.symmetric(
                                    //                           horizontal: 16,
                                    //                           vertical: 1),
                                    //                   title: Row(
                                    //                     children: [
                                    //                       MainText(
                                    //                         e.title,
                                    //                         fontSize: 10,
                                    //                       ),
                                    //                       SizedBox(width: 12),
                                    //                       MainText(
                                    //                         e.value,
                                    //                         fontSize: 12,
                                    //                         fontWeight:
                                    //                             FontWeight.w400,
                                    //                       ),
                                    //                       Spacer(),
                                    //                       MainText(
                                    //                         e.price,
                                    //                         fontSize: 12,
                                    //                         fontWeight:
                                    //                             FontWeight.w400,
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                   onTap: () {
                                    //                     // Handle item selection
                                    //                   },
                                    //                 ),
                                    //               ))
                                    //           .toList(),
                                    //       //   value: selectedValue,
                                    //       onChanged: (value) {},
                                    //       buttonStyleData: ButtonStyleData(
                                    //         height: 45,
                                    //         width: double.infinity,
                                    //         padding: const EdgeInsets.only(
                                    //             left: 10, right: 10),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius:
                                    //               BorderRadius.circular(16),
                                    //           border: Border.all(
                                    //               color: AppColors.white),
                                    //           color: AppColors.white,
                                    //         ),
                                    //       ),
                                    //       // iconStyleData: IconStyleData(
                                    //       //   icon: const Icon(
                                    //       //     Icons.arrow_forward_ios_outlined,
                                    //       //   ),
                                    //       //   iconSize: 14,
                                    //       //   iconEnabledColor: AppColors.black,
                                    //       //   iconDisabledColor: Colors.grey,
                                    //       // ),
                                    //       dropdownStyleData: DropdownStyleData(
                                    //           maxHeight: 400,
                                    //           width: MediaQuery.of(context)
                                    //                   .size
                                    //                   .width *
                                    //               0.8,
                                    //           decoration: BoxDecoration(
                                    //             borderRadius: BorderRadius.circular(14),
                                    //             color: AppColors.white,
                                    //           ),
                                    //           offset: screenWidth > 600
                                    //               ? Offset(
                                    //                   -screenWidth * 0.13, 0)
                                    //               : screenWidth > 550 ||
                                    //                       screenWidth > 360
                                    //                   ? Offset(
                                    //                       -screenWidth * 0.088,
                                    //                       0)
                                    //                   : Offset(
                                    //                       -screenWidth * 0.065,
                                    //                       0)),
                                    //       menuItemStyleData:
                                    //           const MenuItemStyleData(
                                    //         padding: EdgeInsets.only(
                                    //           left: 14,
                                    //           right: 14,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),

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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 12.0),
                                                    child: MainText(
                                                      widget.item.name,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: IconButton(
                                                      icon: Icon(_isExpanded
                                                          ? Icons
                                                              .keyboard_arrow_up
                                                          : Icons
                                                              .keyboard_arrow_down),
                                                      onPressed: () {
                                                        setState(() {
                                                          _isExpanded =
                                                              !_isExpanded;
                                                        });
                                                      },
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      constraints:
                                                          BoxConstraints(
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
        if (_isExpanded)
          DropDownItemWidget(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          )
      ],
    );
  }
}
