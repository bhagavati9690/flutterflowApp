import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/compoents/allvendor_search_comp/filter_not_found_comp/filter_not_found_comp_widget.dart';
import '/compoents/common_comp/custom_errorr_altert_box/custom_errorr_altert_box_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'entertainer_filter_comp_model.dart';
export 'entertainer_filter_comp_model.dart';

class EntertainerFilterCompWidget extends StatefulWidget {
  const EntertainerFilterCompWidget({
    super.key,
    this.entertainerCategorySelected,
    this.priceSelected,
    this.rankSelected,
    this.ageSelected,
    this.townSelected,
    this.serchQuery,
    this.categoryId,
  });

  final List<String>? entertainerCategorySelected;
  final List<String>? priceSelected;
  final List<String>? rankSelected;
  final List<String>? ageSelected;
  final List<String>? townSelected;
  final String? serchQuery;
  final String? categoryId;

  @override
  State<EntertainerFilterCompWidget> createState() =>
      _EntertainerFilterCompWidgetState();
}

class _EntertainerFilterCompWidgetState
    extends State<EntertainerFilterCompWidget> {
  late EntertainerFilterCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntertainerFilterCompModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.entertainerCategorySelected =
          widget.entertainerCategorySelected!.toList().cast<String>();
      _model.priceSelected = widget.priceSelected!.toList().cast<String>();
      _model.rankSelected = widget.rankSelected!.toList().cast<String>();
      _model.ageSelected = widget.ageSelected!.toList().cast<String>();
      _model.townSelected = widget.townSelected!.toList().cast<String>();
      safeSetState(() {});
      safeSetState(() {
        _model.townSelectionsValueController?.reset();
        _model.townValueController?.reset();
        _model.ageSelectionsValueController?.reset();
        _model.ageValueController?.reset();
        _model.rankSelectionsValueController?.reset();
        _model.rankValueController?.reset();
        _model.priceChoiceChipsValueController?.reset();
        _model.priceValueController?.reset();
        _model.entertainerCategorySelectionsValueController?.reset();
        _model.entertainerCategoryValueController?.reset();
      });
      _model.apiResultAll = await EntertainerGroup.gelAllEntertainerCall.call(
        filterQuery: functions.entertainerFilterInputFunction(
            functions.distanceSelectionConverter(FFAppState().distance),
            functions
                .topFilterTypeSelectionConverter(_model.priceSelected.toList())
                ?.unique((e) => e)
                .toList(),
            functions
                .topFilterTypeSelectionConverter(_model.rankSelected.toList())
                ?.unique((e) => e)
                .toList(),
            functions
                .topFilterTypeSelectionConverter(_model.ageSelected.toList())
                ?.unique((e) => e)
                .toList(),
            functions
                .topFilterTypeSelectionConverter(_model.townSelected.toList())
                ?.unique((e) => e)
                .toList(),
            functions
                .topFilterTypeSelectionConverter(
                    _model.entertainerCategorySelected.toList())
                ?.unique((e) => e)
                .toList(),
            widget.categoryId,
            FFAppState().latitude,
            FFAppState().longituade),
        limit: '2',
        query: widget.serchQuery,
        sortQueryJson: functions.getSortingAttributes('relevance', 'desc'),
      );

      if ((_model.apiResultAll?.succeeded ?? true)) {
        await Future.wait([
          Future(() async {
            if (EntertainerGroup.gelAllEntertainerCall
                        .entserviceprovidercategory(
                      (_model.apiResultAll?.jsonBody ?? ''),
                    ) !=
                    null &&
                (EntertainerGroup.gelAllEntertainerCall
                        .entserviceprovidercategory(
                  (_model.apiResultAll?.jsonBody ?? ''),
                ))!
                    .isNotEmpty) {
              _model.entertainerCategory =
                  EntertainerGroup.gelAllEntertainerCall
                      .entserviceprovidercategory(
                        (_model.apiResultAll?.jsonBody ?? ''),
                      )!
                      .toList()
                      .cast<String>();
              _model.entertainerCategoryCount =
                  EntertainerGroup.gelAllEntertainerCall
                      .entserviceprovidercategoryCount(
                        (_model.apiResultAll?.jsonBody ?? ''),
                      )!
                      .toList()
                      .cast<int>();
            }
          }),
          Future(() async {
            if (EntertainerGroup.gelAllEntertainerCall.ranking(
                      (_model.apiResultAll?.jsonBody ?? ''),
                    ) !=
                    null &&
                (EntertainerGroup.gelAllEntertainerCall.ranking(
                  (_model.apiResultAll?.jsonBody ?? ''),
                ))!
                    .isNotEmpty) {
              _model.rank = EntertainerGroup.gelAllEntertainerCall
                  .ranking(
                    (_model.apiResultAll?.jsonBody ?? ''),
                  )!
                  .toList()
                  .cast<String>();
              _model.rankCount = EntertainerGroup.gelAllEntertainerCall
                  .rankingCount(
                    (_model.apiResultAll?.jsonBody ?? ''),
                  )!
                  .toList()
                  .cast<int>();
            }
          }),
          Future(() async {
            if (EntertainerGroup.gelAllEntertainerCall.ageRange(
                      (_model.apiResultAll?.jsonBody ?? ''),
                    ) !=
                    null &&
                (EntertainerGroup.gelAllEntertainerCall.ageRange(
                  (_model.apiResultAll?.jsonBody ?? ''),
                ))!
                    .isNotEmpty) {
              _model.age = EntertainerGroup.gelAllEntertainerCall
                  .ageRange(
                    (_model.apiResultAll?.jsonBody ?? ''),
                  )!
                  .toList()
                  .cast<String>();
              _model.ageCount = EntertainerGroup.gelAllEntertainerCall
                  .ageRangeCount(
                    (_model.apiResultAll?.jsonBody ?? ''),
                  )!
                  .toList()
                  .cast<int>();
            }
          }),
          Future(() async {
            if (EntertainerGroup.gelAllEntertainerCall.town(
                      (_model.apiResultAll?.jsonBody ?? ''),
                    ) !=
                    null &&
                (EntertainerGroup.gelAllEntertainerCall.town(
                  (_model.apiResultAll?.jsonBody ?? ''),
                ))!
                    .isNotEmpty) {
              _model.town = EntertainerGroup.gelAllEntertainerCall
                  .town(
                    (_model.apiResultAll?.jsonBody ?? ''),
                  )!
                  .toList()
                  .cast<String>();
              _model.townCount = EntertainerGroup.gelAllEntertainerCall
                  .townCount(
                    (_model.apiResultAll?.jsonBody ?? ''),
                  )!
                  .toList()
                  .cast<int>();
            }
          }),
          Future(() async {
            if (EntertainerGroup.gelAllEntertainerCall.priceyFactorName(
                      (_model.apiResultAll?.jsonBody ?? ''),
                    ) !=
                    null &&
                (EntertainerGroup.gelAllEntertainerCall.priceyFactorName(
                  (_model.apiResultAll?.jsonBody ?? ''),
                ))!
                    .isNotEmpty) {
              _model.price = EntertainerGroup.gelAllEntertainerCall
                  .priceyFactorName(
                    (_model.apiResultAll?.jsonBody ?? ''),
                  )!
                  .toList()
                  .cast<String>();
              _model.priceCount = EntertainerGroup.gelAllEntertainerCall
                  .priceyFactorCount(
                    (_model.apiResultAll?.jsonBody ?? ''),
                  )!
                  .toList()
                  .cast<int>();
            }
          }),
        ]);
        _model.isPageLoad = true;
        _model.total = EntertainerGroup.gelAllEntertainerCall.count(
          (_model.apiResultAll?.jsonBody ?? ''),
        );
        safeSetState(() {});
      } else {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: CustomErrorrAltertBoxWidget(),
              ),
            );
          },
        );
      }
    });

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController5 =
        ExpandableController(initialExpanded: false);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).lemonLime,
          ),
          child: Visibility(
            visible: _model.isPageLoad ?? true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      'yw7g8qzb' /* Close */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconAlignment: IconAlignment.end,
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).lemonLime,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                if (functions.checkListOfDynamic(
                    EntertainerGroup.gelAllEntertainerCall.aggBuckets(
                  (_model.apiResultAll?.jsonBody ?? ''),
                )))
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    't3sd1pzp' /*  Filter By */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleLargeIsCustom,
                                      ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.entertainerCategorySelected = [];
                                    _model.priceSelected = [];
                                    _model.rankSelected = [];
                                    _model.ageSelected = [];
                                    _model.townSelected = [];
                                    _model.entertainerCategory = [];
                                    _model.entertainerCategoryCount = [];
                                    _model.townCount = [];
                                    _model.town = [];
                                    _model.ageCount = [];
                                    _model.age = [];
                                    _model.rankCount = [];
                                    _model.rank = [];
                                    _model.price = [];
                                    _model.priceCount = [];
                                    _model.total = null;
                                    safeSetState(() {
                                      _model.townSelectionsValueController
                                          ?.reset();
                                      _model.townValueController?.reset();
                                      _model.ageSelectionsValueController
                                          ?.reset();
                                      _model.ageValueController?.reset();
                                      _model.rankSelectionsValueController
                                          ?.reset();
                                      _model.rankValueController?.reset();
                                      _model.priceChoiceChipsValueController
                                          ?.reset();
                                      _model.priceValueController?.reset();
                                      _model
                                          .entertainerCategorySelectionsValueController
                                          ?.reset();
                                      _model.entertainerCategoryValueController
                                          ?.reset();
                                    });
                                    _model.apiResultAllClear =
                                        await EntertainerGroup
                                            .gelAllEntertainerCall
                                            .call(
                                      limit: '2',
                                      query: widget.serchQuery,
                                      sortQueryJson:
                                          functions.getSortingAttributes(
                                              'relevance', 'desc'),
                                      filterQuery: functions.entertainerFilterInputFunction(
                                          functions.distanceSelectionConverter(
                                              FFAppState().distance),
                                          functions
                                              .topFilterTypeSelectionConverter(
                                                  _model.priceSelected.toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          functions
                                              .topFilterTypeSelectionConverter(
                                                  _model.rankSelected.toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          functions
                                              .topFilterTypeSelectionConverter(
                                                  _model.ageSelected.toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          functions
                                              .topFilterTypeSelectionConverter(
                                                  _model.townSelected.toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          functions
                                              .topFilterTypeSelectionConverter(
                                                  _model
                                                      .entertainerCategorySelected
                                                      .toList())
                                              ?.unique((e) => e)
                                              .toList(),
                                          widget.categoryId,
                                          FFAppState().latitude,
                                          FFAppState().longituade),
                                    );

                                    if ((_model.apiResultAllClear?.succeeded ??
                                        true)) {
                                      await Future.wait([
                                        Future(() async {
                                          if (EntertainerGroup
                                                      .gelAllEntertainerCall
                                                      .entserviceprovidercategory(
                                                    (_model.apiResultAllClear
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (EntertainerGroup
                                                      .gelAllEntertainerCall
                                                      .entserviceprovidercategory(
                                                (_model.apiResultAllClear
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty) {
                                            _model.entertainerCategory =
                                                EntertainerGroup
                                                    .gelAllEntertainerCall
                                                    .entserviceprovidercategory(
                                                      (_model.apiResultAllClear
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                    .toList()
                                                    .cast<String>();
                                            _model.entertainerCategoryCount =
                                                EntertainerGroup
                                                    .gelAllEntertainerCall
                                                    .entserviceprovidercategoryCount(
                                                      (_model.apiResultAllClear
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                    .toList()
                                                    .cast<int>();
                                          }
                                        }),
                                        Future(() async {
                                          if (EntertainerGroup
                                                      .gelAllEntertainerCall
                                                      .ranking(
                                                    (_model.apiResultAllClear
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (EntertainerGroup
                                                      .gelAllEntertainerCall
                                                      .ranking(
                                                (_model.apiResultAllClear
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty) {
                                            _model.rank = EntertainerGroup
                                                .gelAllEntertainerCall
                                                .ranking(
                                                  (_model.apiResultAllClear
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                            _model.rankCount = EntertainerGroup
                                                .gelAllEntertainerCall
                                                .rankingCount(
                                                  (_model.apiResultAllClear
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<int>();
                                          }
                                        }),
                                        Future(() async {
                                          if (EntertainerGroup
                                                      .gelAllEntertainerCall
                                                      .ageRange(
                                                    (_model.apiResultAllClear
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (EntertainerGroup
                                                      .gelAllEntertainerCall
                                                      .ageRange(
                                                (_model.apiResultAllClear
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty) {
                                            _model.age = EntertainerGroup
                                                .gelAllEntertainerCall
                                                .ageRange(
                                                  (_model.apiResultAllClear
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                            _model.ageCount = EntertainerGroup
                                                .gelAllEntertainerCall
                                                .ageRangeCount(
                                                  (_model.apiResultAllClear
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<int>();
                                          }
                                        }),
                                        Future(() async {
                                          if (EntertainerGroup
                                                      .gelAllEntertainerCall
                                                      .town(
                                                    (_model.apiResultAllClear
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (EntertainerGroup
                                                      .gelAllEntertainerCall
                                                      .town(
                                                (_model.apiResultAllClear
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty) {
                                            _model.town = EntertainerGroup
                                                .gelAllEntertainerCall
                                                .town(
                                                  (_model.apiResultAllClear
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                            _model.townCount = EntertainerGroup
                                                .gelAllEntertainerCall
                                                .townCount(
                                                  (_model.apiResultAllClear
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<int>();
                                          }
                                        }),
                                        Future(() async {
                                          if (EntertainerGroup
                                                      .gelAllEntertainerCall
                                                      .priceyFactorName(
                                                    (_model.apiResultAllClear
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (EntertainerGroup
                                                      .gelAllEntertainerCall
                                                      .priceyFactorName(
                                                (_model.apiResultAllClear
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty) {
                                            _model.price = EntertainerGroup
                                                .gelAllEntertainerCall
                                                .priceyFactorName(
                                                  (_model.apiResultAllClear
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                            _model.priceCount = EntertainerGroup
                                                .gelAllEntertainerCall
                                                .priceyFactorCount(
                                                  (_model.apiResultAllClear
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<int>();
                                          }
                                        }),
                                      ]);
                                      _model.total = EntertainerGroup
                                          .gelAllEntertainerCall
                                          .count(
                                        (_model.apiResultAllClear?.jsonBody ??
                                            ''),
                                      );
                                      await Future.wait([
                                        Future(() async {
                                          if (_model.entertainerCategorySelected
                                              .isNotEmpty) {
                                            safeSetState(() {
                                              _model.entertainerCategoryValueController
                                                      ?.value =
                                                  functions.findExactMatch1(
                                                      functions
                                                          .venueTypeList(
                                                              _model
                                                                  .entertainerCategory
                                                                  .toList(),
                                                              _model
                                                                  .entertainerCategoryCount
                                                                  .toList())
                                                          ?.toList(),
                                                      _model
                                                          .entertainerCategorySelected
                                                          .toList());
                                            });
                                            safeSetState(() {
                                              _model.entertainerCategorySelectionsValueController
                                                      ?.value =
                                                  _model
                                                      .entertainerCategoryValues!;
                                            });
                                          } else {
                                            safeSetState(() => _model
                                                .entertainerCategorySelectionsValueController
                                                ?.value = []);
                                            safeSetState(() => _model
                                                .entertainerCategoryValueController
                                                ?.value = []);
                                          }
                                        }),
                                        Future(() async {
                                          if (_model.townSelected.isNotEmpty) {
                                            safeSetState(() {
                                              _model.townValueController
                                                      ?.value =
                                                  functions.findExactMatch1(
                                                      functions
                                                          .venueTypeList(
                                                              _model.town
                                                                  .toList(),
                                                              _model.townCount
                                                                  .toList())
                                                          ?.toList(),
                                                      _model.townSelected
                                                          .toList());
                                            });
                                            safeSetState(() {
                                              _model
                                                  .townSelectionsValueController
                                                  ?.value = _model.townValues!;
                                            });
                                          } else {
                                            safeSetState(() => _model
                                                .townValueController
                                                ?.value = []);
                                            safeSetState(() => _model
                                                .townSelectionsValueController
                                                ?.value = []);
                                          }
                                        }),
                                        Future(() async {
                                          if (_model.priceSelected.isNotEmpty) {
                                            safeSetState(() {
                                              _model.priceValueController
                                                      ?.value =
                                                  functions.priceTypeListNumberToStar(functions
                                                      .findExactMatch1(
                                                          functions
                                                              .venueTypeList(
                                                                  _model.price
                                                                      .toList(),
                                                                  _model
                                                                      .priceCount
                                                                      .toList())
                                                              ?.toList(),
                                                          _model.priceSelected
                                                              .toList())
                                                      .toList())!;
                                            });
                                            safeSetState(() {
                                              _model
                                                  .priceChoiceChipsValueController
                                                  ?.value = _model.priceValues!;
                                            });
                                          } else {
                                            safeSetState(() => _model
                                                .priceValueController
                                                ?.value = []);
                                            safeSetState(() => _model
                                                .priceChoiceChipsValueController
                                                ?.value = []);
                                          }
                                        }),
                                        Future(() async {
                                          if (_model.rankSelected.isNotEmpty) {
                                            safeSetState(() {
                                              _model.rankValueController
                                                      ?.value =
                                                  functions.findExactMatch1(
                                                      functions
                                                          .venueTypeList(
                                                              _model.rank
                                                                  .toList(),
                                                              _model.rankCount
                                                                  .toList())
                                                          ?.toList(),
                                                      _model.rankSelected
                                                          .toList());
                                            });
                                            safeSetState(() {
                                              _model
                                                  .rankSelectionsValueController
                                                  ?.value = _model.rankValues!;
                                            });
                                          } else {
                                            safeSetState(() => _model
                                                .rankValueController
                                                ?.value = []);
                                            safeSetState(() => _model
                                                .rankSelectionsValueController
                                                ?.value = []);
                                          }
                                        }),
                                        Future(() async {
                                          if (_model.ageSelected.isNotEmpty) {
                                            safeSetState(() {
                                              _model.ageValueController?.value =
                                                  functions.findExactMatch1(
                                                      functions
                                                          .venueTypeList(
                                                              _model.age
                                                                  .toList(),
                                                              _model.ageCount
                                                                  .toList())
                                                          ?.toList(),
                                                      _model.ageSelected
                                                          .toList());
                                            });
                                            safeSetState(() {
                                              _model
                                                  .ageSelectionsValueController
                                                  ?.value = _model.ageValues!;
                                            });
                                          } else {
                                            safeSetState(() => _model
                                                .ageValueController
                                                ?.value = []);
                                            safeSetState(() => _model
                                                .ageSelectionsValueController
                                                ?.value = []);
                                          }
                                        }),
                                      ]);
                                      _model.entertainerCategorySelected = functions
                                          .combineAndReturnUnique1(
                                              _model.entertainerCategoryValues
                                                  ?.toList(),
                                              _model
                                                  .entertainerCategorySelectionsValues
                                                  ?.toList())
                                          .toList()
                                          .cast<String>();
                                      _model.priceSelected = functions
                                          .combineAndReturnUnique1(
                                              functions
                                                  .priceTypeListStarToNumber(
                                                      _model.priceValues
                                                          ?.toList())
                                                  ?.toList(),
                                              functions
                                                  .priceTypeListStarToNumber(
                                                      _model
                                                          .priceChoiceChipsValues
                                                          ?.toList())
                                                  ?.toList())
                                          .toList()
                                          .cast<String>();
                                      _model.rankSelected = functions
                                          .combineAndReturnUnique1(
                                              _model.rankValues?.toList(),
                                              _model.rankSelectionsValues
                                                  ?.toList())
                                          .toList()
                                          .cast<String>();
                                      _model.ageSelected = functions
                                          .combineAndReturnUnique1(
                                              _model.ageValues?.toList(),
                                              _model.ageSelectionsValues
                                                  ?.toList())
                                          .toList()
                                          .cast<String>();
                                      _model.townSelected = functions
                                          .combineAndReturnUnique1(
                                              _model.townValues?.toList(),
                                              _model.townSelectionsValues
                                                  ?.toList())
                                          .toList()
                                          .cast<String>();
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'hupmmg0v' /* Clear all */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          decoration: TextDecoration.underline,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (_model.entertainerCategory.isNotEmpty)
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller: _model
                                              .expandableExpandableController1,
                                          child: ExpandablePanel(
                                            header: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Icon(
                                                    Icons.domain_add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'wn9peras' /* Entertainer Category */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMediumIsCustom,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            collapsed: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .prioritizeSelected(
                                                            functions
                                                                .findExactMatch(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList())
                                                                ?.toList(),
                                                            functions
                                                                .venueTypeList(
                                                                    _model
                                                                        .entertainerCategory
                                                                        .toList(),
                                                                    _model
                                                                        .entertainerCategoryCount
                                                                        .toList())
                                                                ?.toList())
                                                        .take(5)
                                                        .toList()
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .entertainerCategoryValues =
                                                          val);
                                                      safeSetState(() {
                                                        _model.entertainerCategorySelectionsValueController
                                                                ?.value =
                                                            _model
                                                                .entertainerCategoryValues!;
                                                      });
                                                      _model.entertainerCategorySelected = functions
                                                          .combineAndReturnUnique1(
                                                              _model
                                                                  .entertainerCategoryValues
                                                                  ?.toList(),
                                                              _model
                                                                  .entertainerCategorySelectionsValues
                                                                  ?.toList())
                                                          .toList()
                                                          .cast<String>();
                                                      _model.apiResultAll11 =
                                                          await EntertainerGroup
                                                              .gelAllEntertainerCall
                                                              .call(
                                                        filterQuery: functions.entertainerFilterInputFunction(
                                                            functions.distanceSelectionConverter(
                                                                FFAppState()
                                                                    .distance),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .priceSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .rankSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .ageSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .townSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(
                                                                    _model.entertainerCategorySelected.toList())
                                                                ?.unique((e) => e)
                                                                .toList(),
                                                            widget.categoryId,
                                                            FFAppState().latitude,
                                                            FFAppState().longituade),
                                                        limit: '2',
                                                        query:
                                                            widget.serchQuery,
                                                        sortQueryJson: functions
                                                            .getSortingAttributes(
                                                                'relevance',
                                                                'desc'),
                                                      );

                                                      if ((_model.apiResultAll11
                                                              ?.succeeded ??
                                                          true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                      (_model.apiResultAll11
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                  (_model.apiResultAll11
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.entertainerCategory =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategory(
                                                                        (_model.apiResultAll11?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.entertainerCategoryCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategoryCount(
                                                                        (_model.apiResultAll11?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.entertainerCategory =
                                                                  [];
                                                              _model.entertainerCategoryCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                      (_model.apiResultAll11
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                  (_model.apiResultAll11
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.age =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRange(
                                                                        (_model.apiResultAll11?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.ageCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRangeCount(
                                                                        (_model.apiResultAll11?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.age = [];
                                                              _model.ageCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                      (_model.apiResultAll11
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                  (_model.apiResultAll11
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.town =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .town(
                                                                        (_model.apiResultAll11?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.townCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .townCount(
                                                                        (_model.apiResultAll11?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.town = [];
                                                              _model.townCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                      (_model.apiResultAll11
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                  (_model.apiResultAll11
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.price = EntertainerGroup
                                                                  .gelAllEntertainerCall
                                                                  .priceyFactorName(
                                                                    (_model.apiResultAll11
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              _model.priceCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .priceyFactorCount(
                                                                        (_model.apiResultAll11?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.price = [];
                                                              _model.priceCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                      (_model.apiResultAll11
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                  (_model.apiResultAll11
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.rank =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ranking(
                                                                        (_model.apiResultAll11?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.rankCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .rankingCount(
                                                                        (_model.apiResultAll11?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.rank = [];
                                                              _model.rankCount =
                                                                  [];
                                                            }
                                                          }),
                                                        ]);
                                                        _model.total =
                                                            EntertainerGroup
                                                                .gelAllEntertainerCall
                                                                .count(
                                                          (_model.apiResultAll11
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                .entertainerCategorySelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.entertainerCategoryValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.entertainerCategorySelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .entertainerCategoryValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .entertainerCategorySelectionsValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .entertainerCategoryValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .townSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.townValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.townSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .townValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .townValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .townSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .priceSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.priceValueController?.value = functions.priceTypeListNumberToStar(functions
                                                                    .findExactMatch1(
                                                                        functions
                                                                            .venueTypeList(_model.price.toList(),
                                                                                _model.priceCount.toList())
                                                                            ?.toList(),
                                                                        _model.priceSelected.toList())
                                                                    .toList())!;
                                                              });
                                                              safeSetState(() {
                                                                _model.priceChoiceChipsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .priceValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .priceValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .priceChoiceChipsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .rankSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.rankValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .rankSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.rankSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .rankValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .rankValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .rankSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .ageSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.ageValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.ageSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .ageValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .ageValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .ageSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                        ]);
                                                        _model.entertainerCategorySelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .entertainerCategoryValues
                                                                    ?.toList(),
                                                                _model
                                                                    .entertainerCategorySelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.priceSelected = functions
                                                            .combineAndReturnUnique1(
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceValues
                                                                        ?.toList())
                                                                    ?.toList(),
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceChoiceChipsValues
                                                                        ?.toList())
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.rankSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .rankValues
                                                                    ?.toList(),
                                                                _model
                                                                    .rankSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.ageSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model.ageValues
                                                                    ?.toList(),
                                                                _model
                                                                    .ageSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.townSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .townValues
                                                                    ?.toList(),
                                                                _model
                                                                    .townSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pillColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: true,
                                                    initialized: _model
                                                            .entertainerCategoryValues !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .entertainerCategoryValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      functions.findExactMatch(
                                                          functions
                                                              .venueTypeList(
                                                                  _model
                                                                      .entertainerCategory
                                                                      .toList(),
                                                                  _model
                                                                      .entertainerCategoryCount
                                                                      .toList())
                                                              ?.toList(),
                                                          _model
                                                              .entertainerCategorySelected
                                                              .toList()),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '0evyw4zi' /* more */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .prioritizeSelected(
                                                            functions
                                                                .findExactMatch(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList())
                                                                ?.toList(),
                                                            functions
                                                                .venueTypeList(
                                                                    _model
                                                                        .entertainerCategory
                                                                        .toList(),
                                                                    _model
                                                                        .entertainerCategoryCount
                                                                        .toList())
                                                                ?.toList())
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .entertainerCategorySelectionsValues =
                                                          val);
                                                      safeSetState(() {
                                                        _model.entertainerCategoryValueController
                                                                ?.value =
                                                            _model
                                                                .entertainerCategorySelectionsValues!;
                                                      });
                                                      _model.entertainerCategorySelected = functions
                                                          .combineAndReturnUnique1(
                                                              _model
                                                                  .entertainerCategoryValues
                                                                  ?.toList(),
                                                              _model
                                                                  .entertainerCategorySelectionsValues
                                                                  ?.toList())
                                                          .toList()
                                                          .cast<String>();
                                                      _model.apiResultAll1 =
                                                          await EntertainerGroup
                                                              .gelAllEntertainerCall
                                                              .call(
                                                        filterQuery: functions.entertainerFilterInputFunction(
                                                            functions.distanceSelectionConverter(
                                                                FFAppState()
                                                                    .distance),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .priceSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .rankSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .ageSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .townSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(
                                                                    _model.entertainerCategorySelected.toList())
                                                                ?.unique((e) => e)
                                                                .toList(),
                                                            widget.categoryId,
                                                            FFAppState().latitude,
                                                            FFAppState().longituade),
                                                        limit: '2',
                                                        query:
                                                            widget.serchQuery,
                                                        sortQueryJson: functions
                                                            .getSortingAttributes(
                                                                'relevance',
                                                                'desc'),
                                                      );

                                                      if ((_model.apiResultAll1
                                                              ?.succeeded ??
                                                          true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                      (_model.apiResultAll1
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                  (_model.apiResultAll1
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.rank =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ranking(
                                                                        (_model.apiResultAll1?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.rankCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .rankingCount(
                                                                        (_model.apiResultAll1?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.rank = [];
                                                              _model.rankCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                      (_model.apiResultAll1
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                  (_model.apiResultAll1
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.price = EntertainerGroup
                                                                  .gelAllEntertainerCall
                                                                  .priceyFactorName(
                                                                    (_model.apiResultAll1
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              _model.priceCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .priceyFactorCount(
                                                                        (_model.apiResultAll1?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.price = [];
                                                              _model.priceCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                      (_model.apiResultAll1
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                  (_model.apiResultAll1
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.entertainerCategory =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategory(
                                                                        (_model.apiResultAll1?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.entertainerCategoryCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategoryCount(
                                                                        (_model.apiResultAll1?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.entertainerCategory =
                                                                  [];
                                                              _model.entertainerCategoryCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                      (_model.apiResultAll1
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                  (_model.apiResultAll1
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.age =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRange(
                                                                        (_model.apiResultAll1?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.ageCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRangeCount(
                                                                        (_model.apiResultAll1?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.age = [];
                                                              _model.ageCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                      (_model.apiResultAll1
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                  (_model.apiResultAll1
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.town =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .town(
                                                                        (_model.apiResultAll1?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.townCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .townCount(
                                                                        (_model.apiResultAll1?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.town = [];
                                                              _model.townCount =
                                                                  [];
                                                            }
                                                          }),
                                                        ]);
                                                        _model.total =
                                                            EntertainerGroup
                                                                .gelAllEntertainerCall
                                                                .count(
                                                          (_model.apiResultAll1
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                .entertainerCategorySelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.entertainerCategoryValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.entertainerCategorySelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .entertainerCategoryValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .entertainerCategorySelectionsValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .entertainerCategoryValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .priceSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.priceValueController?.value = functions.priceTypeListNumberToStar(functions
                                                                    .findExactMatch1(
                                                                        functions
                                                                            .venueTypeList(_model.price.toList(),
                                                                                _model.priceCount.toList())
                                                                            ?.toList(),
                                                                        _model.priceSelected.toList())
                                                                    .toList())!;
                                                              });
                                                              safeSetState(() {
                                                                _model.priceChoiceChipsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .priceValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .priceValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .priceChoiceChipsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .rankSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.rankValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .rankSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.rankSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .rankValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .rankValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .rankSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .ageSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.ageValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.ageSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .ageValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .ageValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .ageSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .townSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.townValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.townSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .townValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .townValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .townSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                        ]);
                                                        _model.entertainerCategorySelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .entertainerCategoryValues
                                                                    ?.toList(),
                                                                _model
                                                                    .entertainerCategorySelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.priceSelected = functions
                                                            .combineAndReturnUnique1(
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceValues
                                                                        ?.toList())
                                                                    ?.toList(),
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceChoiceChipsValues
                                                                        ?.toList())
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.rankSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .rankValues
                                                                    ?.toList(),
                                                                _model
                                                                    .rankSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.ageSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model.ageValues
                                                                    ?.toList(),
                                                                _model
                                                                    .ageSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.townSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .townValues
                                                                    ?.toList(),
                                                                _model
                                                                    .townSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: true,
                                                    initialized: _model
                                                            .entertainerCategorySelectionsValues !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .entertainerCategorySelectionsValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      functions.findExactMatch(
                                                          functions
                                                              .venueTypeList(
                                                                  _model
                                                                      .entertainerCategory
                                                                      .toList(),
                                                                  _model
                                                                      .entertainerCategoryCount
                                                                      .toList())
                                                              ?.toList(),
                                                          _model
                                                              .entertainerCategorySelected
                                                              .toList()),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'o8xyobsi' /* less */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: true,
                                              tapBodyToCollapse: true,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .top,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_model.price.isNotEmpty)
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller: _model
                                              .expandableExpandableController2,
                                          child: ExpandablePanel(
                                            header: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .funnelDollar,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qpotqo53' /* Price */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMediumIsCustom,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            collapsed: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .prioritizeSelected(
                                                            functions
                                                                .priceTypeListNumberToStar(functions
                                                                    .findExactMatch(
                                                                        functions
                                                                            .venueTypeList(
                                                                                _model.price
                                                                                    .toList(),
                                                                                _model.priceCount
                                                                                    .toList())
                                                                            ?.toList(),
                                                                        _model
                                                                            .priceSelected
                                                                            .toList())
                                                                    ?.toList())
                                                                ?.toList(),
                                                            functions
                                                                .priceTypeList(
                                                                    _model.price
                                                                        .toList(),
                                                                    _model
                                                                        .priceCount
                                                                        .toList())
                                                                ?.toList())
                                                        .take(5)
                                                        .toList()
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                          .priceValues = val);
                                                      safeSetState(() {
                                                        _model.priceChoiceChipsValueController
                                                                ?.value =
                                                            _model.priceValues!;
                                                      });
                                                      _model.priceSelected = functions
                                                          .combineAndReturnUnique1(
                                                              functions
                                                                  .priceTypeListStarToNumber(_model
                                                                      .priceValues
                                                                      ?.toList())
                                                                  ?.toList(),
                                                              functions
                                                                  .priceTypeListStarToNumber(_model
                                                                      .priceChoiceChipsValues
                                                                      ?.toList())
                                                                  ?.toList())
                                                          .toList()
                                                          .cast<String>();
                                                      _model.apiResultAll14 =
                                                          await EntertainerGroup
                                                              .gelAllEntertainerCall
                                                              .call(
                                                        filterQuery: functions.entertainerFilterInputFunction(
                                                            functions.distanceSelectionConverter(
                                                                FFAppState()
                                                                    .distance),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .priceSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .rankSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .ageSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .townSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(
                                                                    _model.entertainerCategorySelected.toList())
                                                                ?.unique((e) => e)
                                                                .toList(),
                                                            widget.categoryId,
                                                            FFAppState().latitude,
                                                            FFAppState().longituade),
                                                        limit: '2',
                                                        query:
                                                            widget.serchQuery,
                                                        sortQueryJson: functions
                                                            .getSortingAttributes(
                                                                'relevance',
                                                                'desc'),
                                                      );

                                                      if ((_model.apiResultAll14
                                                              ?.succeeded ??
                                                          true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                      (_model.apiResultAll14
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                  (_model.apiResultAll14
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.price = EntertainerGroup
                                                                  .gelAllEntertainerCall
                                                                  .priceyFactorName(
                                                                    (_model.apiResultAll14
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              _model.priceCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .priceyFactorCount(
                                                                        (_model.apiResultAll14?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.priceCount =
                                                                  [];
                                                              _model.price = [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                      (_model.apiResultAll14
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                  (_model.apiResultAll14
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.rank =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ranking(
                                                                        (_model.apiResultAll14?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.rankCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .rankingCount(
                                                                        (_model.apiResultAll14?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.rankCount =
                                                                  [];
                                                              _model.rank = [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                      (_model.apiResultAll14
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                  (_model.apiResultAll14
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.town =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .town(
                                                                        (_model.apiResultAll14?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.townCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .townCount(
                                                                        (_model.apiResultAll14?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.townCount =
                                                                  [];
                                                              _model.town = [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                      (_model.apiResultAll14
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                  (_model.apiResultAll14
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.age =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRange(
                                                                        (_model.apiResultAll14?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.ageCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRangeCount(
                                                                        (_model.apiResultAll14?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.age = [];
                                                              _model.ageCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                      (_model.apiResultAll14
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                  (_model.apiResultAll14
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.entertainerCategory =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategory(
                                                                        (_model.apiResultAll14?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.entertainerCategoryCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategoryCount(
                                                                        (_model.apiResultAll14?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.entertainerCategory =
                                                                  [];
                                                              _model.entertainerCategoryCount =
                                                                  [];
                                                            }
                                                          }),
                                                        ]);
                                                        _model.total =
                                                            EntertainerGroup
                                                                .gelAllEntertainerCall
                                                                .count(
                                                          (_model.apiResultAll14
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                .entertainerCategorySelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.entertainerCategoryValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.entertainerCategorySelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .entertainerCategoryValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .entertainerCategorySelectionsValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .entertainerCategoryValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .priceSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.priceValueController?.value = functions.priceTypeListNumberToStar(functions
                                                                    .findExactMatch1(
                                                                        functions
                                                                            .venueTypeList(_model.price.toList(),
                                                                                _model.priceCount.toList())
                                                                            ?.toList(),
                                                                        _model.priceSelected.toList())
                                                                    .toList())!;
                                                              });
                                                              safeSetState(() {
                                                                _model.priceChoiceChipsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .priceValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .priceValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .priceChoiceChipsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .rankSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.rankValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .rankSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.rankSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .rankValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .rankValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .rankSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .ageSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.ageValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.ageSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .ageValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .ageValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .ageSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .townSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.townValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.townSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .townValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .townValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .townSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                        ]);
                                                        _model.entertainerCategorySelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .entertainerCategoryValues
                                                                    ?.toList(),
                                                                _model
                                                                    .entertainerCategorySelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.priceSelected = functions
                                                            .combineAndReturnUnique1(
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceValues
                                                                        ?.toList())
                                                                    ?.toList(),
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceChoiceChipsValues
                                                                        ?.toList())
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.rankSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .rankValues
                                                                    ?.toList(),
                                                                _model
                                                                    .rankSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.ageSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model.ageValues
                                                                    ?.toList(),
                                                                _model
                                                                    .ageSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.townSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .townValues
                                                                    ?.toList(),
                                                                _model
                                                                    .townSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pillColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: true,
                                                    initialized:
                                                        _model.priceValues !=
                                                            null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .priceValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      functions.priceTypeListNumberToStar(functions
                                                          .findExactMatch(
                                                              functions
                                                                  .venueTypeList(
                                                                      _model
                                                                          .price
                                                                          .toList(),
                                                                      _model
                                                                          .priceCount
                                                                          .toList())
                                                                  ?.toList(),
                                                              _model
                                                                  .priceSelected
                                                                  .toList())
                                                          ?.toList()),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'v9nzpvdv' /* more */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .prioritizeSelected(
                                                            functions
                                                                .priceTypeListNumberToStar(functions
                                                                    .findExactMatch(
                                                                        functions
                                                                            .venueTypeList(
                                                                                _model.price
                                                                                    .toList(),
                                                                                _model.priceCount
                                                                                    .toList())
                                                                            ?.toList(),
                                                                        _model
                                                                            .priceSelected
                                                                            .toList())
                                                                    ?.toList())
                                                                ?.toList(),
                                                            functions
                                                                .priceTypeList(
                                                                    _model.price
                                                                        .toList(),
                                                                    _model
                                                                        .priceCount
                                                                        .toList())
                                                                ?.toList())
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .priceChoiceChipsValues =
                                                          val);
                                                      safeSetState(() {
                                                        _model.priceValueController
                                                                ?.value =
                                                            _model
                                                                .priceChoiceChipsValues!;
                                                      });
                                                      _model.priceSelected = functions
                                                          .combineAndReturnUnique1(
                                                              functions
                                                                  .priceTypeListStarToNumber(_model
                                                                      .priceValues
                                                                      ?.toList())
                                                                  ?.toList(),
                                                              functions
                                                                  .priceTypeListStarToNumber(_model
                                                                      .priceChoiceChipsValues
                                                                      ?.toList())
                                                                  ?.toList())
                                                          .toList()
                                                          .cast<String>();
                                                      _model.apiResultAll4 =
                                                          await EntertainerGroup
                                                              .gelAllEntertainerCall
                                                              .call(
                                                        filterQuery: functions.entertainerFilterInputFunction(
                                                            functions.distanceSelectionConverter(
                                                                FFAppState()
                                                                    .distance),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .priceSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .rankSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .ageSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .townSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(
                                                                    _model.entertainerCategorySelected.toList())
                                                                ?.unique((e) => e)
                                                                .toList(),
                                                            widget.categoryId,
                                                            FFAppState().latitude,
                                                            FFAppState().longituade),
                                                        limit: '2',
                                                        query:
                                                            widget.serchQuery,
                                                        sortQueryJson: functions
                                                            .getSortingAttributes(
                                                                'relevance',
                                                                'desc'),
                                                      );

                                                      if ((_model.apiResultAll4
                                                              ?.succeeded ??
                                                          true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                      (_model.apiResultAll4
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                  (_model.apiResultAll4
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.price = EntertainerGroup
                                                                  .gelAllEntertainerCall
                                                                  .priceyFactorName(
                                                                    (_model.apiResultAll4
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              _model.priceCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .priceyFactorCount(
                                                                        (_model.apiResultAll4?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.priceCount =
                                                                  [];
                                                              _model.price = [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                      (_model.apiResultAll4
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                  (_model.apiResultAll4
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.rank =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ranking(
                                                                        (_model.apiResultAll4?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.rankCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .rankingCount(
                                                                        (_model.apiResultAll4?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.rankCount =
                                                                  [];
                                                              _model.rank = [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                      (_model.apiResultAll4
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                  (_model.apiResultAll4
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.town =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .town(
                                                                        (_model.apiResultAll4?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.townCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .townCount(
                                                                        (_model.apiResultAll4?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.townCount =
                                                                  [];
                                                              _model.town = [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                      (_model.apiResultAll4
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                  (_model.apiResultAll4
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.age =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRange(
                                                                        (_model.apiResultAll4?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.ageCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRangeCount(
                                                                        (_model.apiResultAll4?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.age = [];
                                                              _model.ageCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                      (_model.apiResultAll4
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                  (_model.apiResultAll4
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.entertainerCategory =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategory(
                                                                        (_model.apiResultAll4?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.entertainerCategoryCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategoryCount(
                                                                        (_model.apiResultAll4?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.entertainerCategory =
                                                                  [];
                                                              _model.entertainerCategoryCount =
                                                                  [];
                                                            }
                                                          }),
                                                        ]);
                                                        _model.total =
                                                            EntertainerGroup
                                                                .gelAllEntertainerCall
                                                                .count(
                                                          (_model.apiResultAll4
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                .entertainerCategorySelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.entertainerCategoryValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.entertainerCategorySelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .entertainerCategoryValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .entertainerCategorySelectionsValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .entertainerCategoryValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .priceSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.priceValueController?.value = functions.priceTypeListNumberToStar(functions
                                                                    .findExactMatch1(
                                                                        functions
                                                                            .venueTypeList(_model.price.toList(),
                                                                                _model.priceCount.toList())
                                                                            ?.toList(),
                                                                        _model.priceSelected.toList())
                                                                    .toList())!;
                                                              });
                                                              safeSetState(() {
                                                                _model.priceChoiceChipsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .priceValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .priceValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .priceChoiceChipsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .rankSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.rankValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .rankSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.rankSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .rankValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .rankValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .rankSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .ageSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.ageValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.ageSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .ageValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .ageValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .ageSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .townSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.townValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.townSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .townValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .townValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .townSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                        ]);
                                                        _model.entertainerCategorySelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .entertainerCategoryValues
                                                                    ?.toList(),
                                                                _model
                                                                    .entertainerCategorySelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.priceSelected = functions
                                                            .combineAndReturnUnique1(
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceValues
                                                                        ?.toList())
                                                                    ?.toList(),
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceChoiceChipsValues
                                                                        ?.toList())
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.rankSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .rankValues
                                                                    ?.toList(),
                                                                _model
                                                                    .rankSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.ageSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model.ageValues
                                                                    ?.toList(),
                                                                _model
                                                                    .ageSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.townSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .townValues
                                                                    ?.toList(),
                                                                _model
                                                                    .townSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: true,
                                                    initialized: _model
                                                            .priceChoiceChipsValues !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .priceChoiceChipsValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      functions.priceTypeListNumberToStar(functions
                                                          .findExactMatch(
                                                              functions
                                                                  .venueTypeList(
                                                                      _model
                                                                          .price
                                                                          .toList(),
                                                                      _model
                                                                          .priceCount
                                                                          .toList())
                                                                  ?.toList(),
                                                              _model
                                                                  .priceSelected
                                                                  .toList())
                                                          ?.toList()),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9opahf1z' /* less */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: true,
                                              tapBodyToCollapse: true,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .top,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_model.rank.isNotEmpty)
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller: _model
                                              .expandableExpandableController3,
                                          child: ExpandablePanel(
                                            header: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Icon(
                                                    Icons.favorite,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'g90n7jue' /* Ranking */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMediumIsCustom,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            collapsed: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .prioritizeSelected(
                                                            functions
                                                                .findExactMatch(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    widget
                                                                        .rankSelected
                                                                        ?.toList())
                                                                ?.toList(),
                                                            functions
                                                                .venueTypeList(
                                                                    _model.rank
                                                                        .toList(),
                                                                    _model
                                                                        .rankCount
                                                                        .toList())
                                                                ?.toList())
                                                        .take(5)
                                                        .toList()
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                          .rankValues = val);
                                                      safeSetState(() {
                                                        _model.rankSelectionsValueController
                                                                ?.value =
                                                            _model.rankValues!;
                                                      });
                                                      _model.rankSelected = functions
                                                          .combineAndReturnUnique1(
                                                              _model.rankValues
                                                                  ?.toList(),
                                                              _model
                                                                  .rankSelectionsValues
                                                                  ?.toList())
                                                          .toList()
                                                          .cast<String>();
                                                      _model.apiResultAll15 =
                                                          await EntertainerGroup
                                                              .gelAllEntertainerCall
                                                              .call(
                                                        filterQuery: functions.entertainerFilterInputFunction(
                                                            functions.distanceSelectionConverter(
                                                                FFAppState()
                                                                    .distance),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .priceSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .rankSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .ageSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .townSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(
                                                                    _model.entertainerCategorySelected.toList())
                                                                ?.unique((e) => e)
                                                                .toList(),
                                                            widget.categoryId,
                                                            FFAppState().latitude,
                                                            FFAppState().longituade),
                                                        limit: '2',
                                                        query:
                                                            widget.serchQuery,
                                                        sortQueryJson: functions
                                                            .getSortingAttributes(
                                                                'relevance',
                                                                'desc'),
                                                      );

                                                      if ((_model.apiResultAll15
                                                              ?.succeeded ??
                                                          true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                      (_model.apiResultAll15
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                  (_model.apiResultAll15
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.price = EntertainerGroup
                                                                  .gelAllEntertainerCall
                                                                  .priceyFactorName(
                                                                    (_model.apiResultAll15
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              _model.priceCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .priceyFactorCount(
                                                                        (_model.apiResultAll15?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.price = [];
                                                              _model.priceCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                      (_model.apiResultAll15
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                  (_model.apiResultAll15
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.town =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .town(
                                                                        (_model.apiResultAll15?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.townCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .townCount(
                                                                        (_model.apiResultAll15?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.town = [];
                                                              _model.townCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                      (_model.apiResultAll15
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                  (_model.apiResultAll15
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.rank =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ranking(
                                                                        (_model.apiResultAll15?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.rankCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .rankingCount(
                                                                        (_model.apiResultAll15?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.rank = [];
                                                              _model.rankCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                      (_model.apiResultAll15
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                  (_model.apiResultAll15
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.entertainerCategory =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategory(
                                                                        (_model.apiResultAll15?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.entertainerCategoryCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategoryCount(
                                                                        (_model.apiResultAll15?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.entertainerCategory =
                                                                  [];
                                                              _model.entertainerCategoryCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                      (_model.apiResultAll15
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                  (_model.apiResultAll15
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.age =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRange(
                                                                        (_model.apiResultAll15?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.ageCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRangeCount(
                                                                        (_model.apiResultAll15?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.age = [];
                                                              _model.ageCount =
                                                                  [];
                                                            }
                                                          }),
                                                        ]);
                                                        _model.total =
                                                            EntertainerGroup
                                                                .gelAllEntertainerCall
                                                                .count(
                                                          (_model.apiResultAll15
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                .entertainerCategorySelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.entertainerCategoryValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.entertainerCategorySelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .entertainerCategoryValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .entertainerCategorySelectionsValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .entertainerCategoryValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .priceSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.priceValueController?.value = functions.priceTypeListNumberToStar(functions
                                                                    .findExactMatch1(
                                                                        functions
                                                                            .venueTypeList(_model.price.toList(),
                                                                                _model.priceCount.toList())
                                                                            ?.toList(),
                                                                        _model.priceSelected.toList())
                                                                    .toList())!;
                                                              });
                                                              safeSetState(() {
                                                                _model.priceChoiceChipsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .priceValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .priceValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .priceChoiceChipsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .rankSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.rankValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .rankSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.rankSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .rankValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .rankValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .rankSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .ageSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.ageValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.ageSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .ageValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .ageValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .ageSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .townSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.townValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.townSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .townValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .townValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .townSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                        ]);
                                                        _model.entertainerCategorySelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .entertainerCategoryValues
                                                                    ?.toList(),
                                                                _model
                                                                    .entertainerCategorySelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.priceSelected = functions
                                                            .combineAndReturnUnique1(
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceValues
                                                                        ?.toList())
                                                                    ?.toList(),
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceChoiceChipsValues
                                                                        ?.toList())
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.rankSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .rankValues
                                                                    ?.toList(),
                                                                _model
                                                                    .rankSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.ageSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model.ageValues
                                                                    ?.toList(),
                                                                _model
                                                                    .ageSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.townSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .townValues
                                                                    ?.toList(),
                                                                _model
                                                                    .townSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pillColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: true,
                                                    initialized:
                                                        _model.rankValues !=
                                                            null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .rankValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      functions.findExactMatch(
                                                          functions
                                                              .venueTypeList(
                                                                  _model.rank
                                                                      .toList(),
                                                                  _model
                                                                      .rankCount
                                                                      .toList())
                                                              ?.toList(),
                                                          widget.rankSelected
                                                              ?.toList()),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7a504bxl' /* more */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .prioritizeSelected(
                                                            functions
                                                                .findExactMatch(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    widget
                                                                        .rankSelected
                                                                        ?.toList())
                                                                ?.toList(),
                                                            functions
                                                                .venueTypeList(
                                                                    _model.rank
                                                                        .toList(),
                                                                    _model
                                                                        .rankCount
                                                                        .toList())
                                                                ?.toList())
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .rankSelectionsValues =
                                                          val);
                                                      safeSetState(() {
                                                        _model.rankValueController
                                                                ?.value =
                                                            _model
                                                                .rankSelectionsValues!;
                                                      });
                                                      _model.rankSelected = functions
                                                          .combineAndReturnUnique1(
                                                              _model.rankValues
                                                                  ?.toList(),
                                                              _model
                                                                  .rankSelectionsValues
                                                                  ?.toList())
                                                          .toList()
                                                          .cast<String>();
                                                      _model.apiResultAll5 =
                                                          await EntertainerGroup
                                                              .gelAllEntertainerCall
                                                              .call(
                                                        filterQuery: functions.entertainerFilterInputFunction(
                                                            functions.distanceSelectionConverter(
                                                                FFAppState()
                                                                    .distance),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .priceSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .rankSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .ageSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .townSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(
                                                                    _model.entertainerCategorySelected.toList())
                                                                ?.unique((e) => e)
                                                                .toList(),
                                                            widget.categoryId,
                                                            FFAppState().latitude,
                                                            FFAppState().longituade),
                                                        limit: '2',
                                                        query:
                                                            widget.serchQuery,
                                                        sortQueryJson: functions
                                                            .getSortingAttributes(
                                                                'relevance',
                                                                'desc'),
                                                      );

                                                      if ((_model.apiResultAll5
                                                              ?.succeeded ??
                                                          true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                      (_model.apiResultAll5
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                  (_model.apiResultAll5
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.price = EntertainerGroup
                                                                  .gelAllEntertainerCall
                                                                  .priceyFactorName(
                                                                    (_model.apiResultAll5
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              _model.priceCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .priceyFactorCount(
                                                                        (_model.apiResultAll5?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.price = [];
                                                              _model.priceCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                      (_model.apiResultAll5
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                  (_model.apiResultAll5
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.town =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .town(
                                                                        (_model.apiResultAll5?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.townCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .townCount(
                                                                        (_model.apiResultAll5?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.town = [];
                                                              _model.townCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                      (_model.apiResultAll5
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                  (_model.apiResultAll5
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.rank =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ranking(
                                                                        (_model.apiResultAll5?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.rankCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .rankingCount(
                                                                        (_model.apiResultAll5?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.rank = [];
                                                              _model.rankCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                      (_model.apiResultAll5
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                  (_model.apiResultAll5
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.entertainerCategory =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategory(
                                                                        (_model.apiResultAll5?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.entertainerCategoryCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategoryCount(
                                                                        (_model.apiResultAll5?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.entertainerCategory =
                                                                  [];
                                                              _model.entertainerCategoryCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                      (_model.apiResultAll5
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                  (_model.apiResultAll5
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.age =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRange(
                                                                        (_model.apiResultAll5?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.ageCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRangeCount(
                                                                        (_model.apiResultAll5?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.age = [];
                                                              _model.ageCount =
                                                                  [];
                                                            }
                                                          }),
                                                        ]);
                                                        _model.total =
                                                            EntertainerGroup
                                                                .gelAllEntertainerCall
                                                                .count(
                                                          (_model.apiResultAll5
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                .entertainerCategorySelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.entertainerCategoryValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.entertainerCategorySelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .entertainerCategoryValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .entertainerCategorySelectionsValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .entertainerCategoryValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .priceSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.priceValueController?.value = functions.priceTypeListNumberToStar(functions
                                                                    .findExactMatch1(
                                                                        functions
                                                                            .venueTypeList(_model.price.toList(),
                                                                                _model.priceCount.toList())
                                                                            ?.toList(),
                                                                        _model.priceSelected.toList())
                                                                    .toList())!;
                                                              });
                                                              safeSetState(() {
                                                                _model.priceChoiceChipsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .priceValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .priceValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .priceChoiceChipsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .rankSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.rankValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .rankSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.rankSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .rankValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .rankValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .rankSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .ageSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.ageValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.ageSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .ageValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .ageValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .ageSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .townSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.townValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.townSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .townValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .townValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .townSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                        ]);
                                                        _model.entertainerCategorySelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .entertainerCategoryValues
                                                                    ?.toList(),
                                                                _model
                                                                    .entertainerCategorySelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.priceSelected = functions
                                                            .combineAndReturnUnique1(
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceValues
                                                                        ?.toList())
                                                                    ?.toList(),
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceChoiceChipsValues
                                                                        ?.toList())
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.rankSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .rankValues
                                                                    ?.toList(),
                                                                _model
                                                                    .rankSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.ageSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model.ageValues
                                                                    ?.toList(),
                                                                _model
                                                                    .ageSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.townSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .townValues
                                                                    ?.toList(),
                                                                _model
                                                                    .townSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: true,
                                                    initialized: _model
                                                            .rankSelectionsValues !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .rankSelectionsValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      functions.findExactMatch(
                                                          functions
                                                              .venueTypeList(
                                                                  _model.rank
                                                                      .toList(),
                                                                  _model
                                                                      .rankCount
                                                                      .toList())
                                                              ?.toList(),
                                                          _model.rankSelected
                                                              .toList()),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fnqlp57c' /* less */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: true,
                                              tapBodyToCollapse: true,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .top,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_model.age.isNotEmpty)
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller: _model
                                              .expandableExpandableController4,
                                          child: ExpandablePanel(
                                            header: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Icon(
                                                    Icons.assist_walker,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '323lklnd' /* Age */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMediumIsCustom,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            collapsed: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .prioritizeSelected(
                                                            functions
                                                                .findExactMatch(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList())
                                                                ?.toList(),
                                                            functions
                                                                .venueTypeList(
                                                                    _model.age
                                                                        .toList(),
                                                                    _model
                                                                        .ageCount
                                                                        .toList())
                                                                ?.toList())
                                                        .take(5)
                                                        .toList()
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                          .ageValues = val);
                                                      safeSetState(() {
                                                        _model.ageSelectionsValueController
                                                                ?.value =
                                                            _model.ageValues!;
                                                      });
                                                      _model.ageSelected = functions
                                                          .combineAndReturnUnique1(
                                                              _model.ageValues
                                                                  ?.toList(),
                                                              _model
                                                                  .ageSelectionsValues
                                                                  ?.toList())
                                                          .toList()
                                                          .cast<String>();
                                                      _model.apiResultAll16 =
                                                          await EntertainerGroup
                                                              .gelAllEntertainerCall
                                                              .call(
                                                        filterQuery: functions.entertainerFilterInputFunction(
                                                            functions.distanceSelectionConverter(
                                                                FFAppState()
                                                                    .distance),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .priceSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .rankSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .ageSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .townSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(
                                                                    _model.entertainerCategorySelected.toList())
                                                                ?.unique((e) => e)
                                                                .toList(),
                                                            widget.categoryId,
                                                            FFAppState().latitude,
                                                            FFAppState().longituade),
                                                        limit: '2',
                                                        query:
                                                            widget.serchQuery,
                                                        sortQueryJson: functions
                                                            .getSortingAttributes(
                                                                'relevance',
                                                                'desc'),
                                                      );

                                                      if ((_model.apiResultAll16
                                                              ?.succeeded ??
                                                          true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                      (_model.apiResultAll16
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                  (_model.apiResultAll16
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.rank =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ranking(
                                                                        (_model.apiResultAll16?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.rankCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .rankingCount(
                                                                        (_model.apiResultAll16?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.rank = [];
                                                              _model.rankCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                      (_model.apiResultAll16
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                  (_model.apiResultAll16
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.entertainerCategory =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategory(
                                                                        (_model.apiResultAll16?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.entertainerCategoryCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategoryCount(
                                                                        (_model.apiResultAll16?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.entertainerCategory =
                                                                  [];
                                                              _model.entertainerCategoryCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                      (_model.apiResultAll16
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                  (_model.apiResultAll16
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.age =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRange(
                                                                        (_model.apiResultAll16?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.ageCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRangeCount(
                                                                        (_model.apiResultAll16?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.age = [];
                                                              _model.ageCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                      (_model.apiResultAll16
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                  (_model.apiResultAll16
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.town =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .town(
                                                                        (_model.apiResultAll16?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.townCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .townCount(
                                                                        (_model.apiResultAll16?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.town = [];
                                                              _model.townCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceFactor(
                                                                      (_model.apiResultAll16
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceFactor(
                                                                  (_model.apiResultAll16
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.price = EntertainerGroup
                                                                  .gelAllEntertainerCall
                                                                  .priceyFactorName(
                                                                    (_model.apiResultAll16
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              _model.priceCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .priceyFactorCount(
                                                                        (_model.apiResultAll16?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.price = [];
                                                              _model.priceCount =
                                                                  [];
                                                            }
                                                          }),
                                                        ]);
                                                        _model.total =
                                                            EntertainerGroup
                                                                .gelAllEntertainerCall
                                                                .count(
                                                          (_model.apiResultAll16
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                .entertainerCategorySelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.entertainerCategoryValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.entertainerCategorySelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .entertainerCategoryValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .entertainerCategorySelectionsValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .entertainerCategoryValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .priceSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.priceValueController?.value = functions.priceTypeListNumberToStar(functions
                                                                    .findExactMatch1(
                                                                        functions
                                                                            .venueTypeList(_model.price.toList(),
                                                                                _model.priceCount.toList())
                                                                            ?.toList(),
                                                                        _model.priceSelected.toList())
                                                                    .toList())!;
                                                              });
                                                              safeSetState(() {
                                                                _model.priceChoiceChipsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .priceValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .priceValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .priceChoiceChipsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .rankSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.rankValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .rankSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.rankSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .rankValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .rankValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .rankSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .ageSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.ageValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.ageSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .ageValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .ageValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .ageSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .townSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.townValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.townSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .townValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .townValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .townSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                        ]);
                                                        _model.entertainerCategorySelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .entertainerCategoryValues
                                                                    ?.toList(),
                                                                _model
                                                                    .entertainerCategorySelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.priceSelected = functions
                                                            .combineAndReturnUnique1(
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceValues
                                                                        ?.toList())
                                                                    ?.toList(),
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceChoiceChipsValues
                                                                        ?.toList())
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.rankSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .rankValues
                                                                    ?.toList(),
                                                                _model
                                                                    .rankSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.ageSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model.ageValues
                                                                    ?.toList(),
                                                                _model
                                                                    .ageSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.townSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .townValues
                                                                    ?.toList(),
                                                                _model
                                                                    .townSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pillColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: true,
                                                    initialized:
                                                        _model.ageValues !=
                                                            null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .ageValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      functions.findExactMatch(
                                                          functions
                                                              .venueTypeList(
                                                                  _model.age
                                                                      .toList(),
                                                                  _model
                                                                      .ageCount
                                                                      .toList())
                                                              ?.toList(),
                                                          _model.ageSelected
                                                              .toList()),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'uzrdbq55' /* more */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .prioritizeSelected(
                                                            functions
                                                                .findExactMatch(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList())
                                                                ?.toList(),
                                                            functions
                                                                .venueTypeList(
                                                                    _model.age
                                                                        .toList(),
                                                                    _model
                                                                        .ageCount
                                                                        .toList())
                                                                ?.toList())
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .ageSelectionsValues =
                                                          val);
                                                      safeSetState(() {
                                                        _model.ageValueController
                                                                ?.value =
                                                            _model
                                                                .ageSelectionsValues!;
                                                      });
                                                      _model.ageSelected = functions
                                                          .combineAndReturnUnique1(
                                                              _model.ageValues
                                                                  ?.toList(),
                                                              _model
                                                                  .ageSelectionsValues
                                                                  ?.toList())
                                                          .toList()
                                                          .cast<String>();
                                                      _model.apiResultAll6 =
                                                          await EntertainerGroup
                                                              .gelAllEntertainerCall
                                                              .call(
                                                        filterQuery: functions.entertainerFilterInputFunction(
                                                            functions.distanceSelectionConverter(
                                                                FFAppState()
                                                                    .distance),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .priceSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .rankSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .ageSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .townSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(
                                                                    _model.entertainerCategorySelected.toList())
                                                                ?.unique((e) => e)
                                                                .toList(),
                                                            widget.categoryId,
                                                            FFAppState().latitude,
                                                            FFAppState().longituade),
                                                        limit: '2',
                                                        query:
                                                            widget.serchQuery,
                                                        sortQueryJson: functions
                                                            .getSortingAttributes(
                                                                'relevance',
                                                                'desc'),
                                                      );

                                                      if ((_model.apiResultAll6
                                                              ?.succeeded ??
                                                          true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                      (_model.apiResultAll6
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                  (_model.apiResultAll6
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.price = EntertainerGroup
                                                                  .gelAllEntertainerCall
                                                                  .priceyFactorName(
                                                                    (_model.apiResultAll6
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              _model.priceCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .priceyFactorCount(
                                                                        (_model.apiResultAll6?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.price = [];
                                                              _model.priceCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                      (_model.apiResultAll6
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                  (_model.apiResultAll6
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.rank =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ranking(
                                                                        (_model.apiResultAll6?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.rankCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .rankingCount(
                                                                        (_model.apiResultAll6?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.rank = [];
                                                              _model.rankCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                      (_model.apiResultAll6
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                  (_model.apiResultAll6
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.entertainerCategory =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategory(
                                                                        (_model.apiResultAll6?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.entertainerCategoryCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategoryCount(
                                                                        (_model.apiResultAll6?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.entertainerCategory =
                                                                  [];
                                                              _model.entertainerCategoryCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                      (_model.apiResultAll6
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                  (_model.apiResultAll6
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.age =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRange(
                                                                        (_model.apiResultAll6?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.ageCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRangeCount(
                                                                        (_model.apiResultAll6?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.age = [];
                                                              _model.ageCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                      (_model.apiResultAll6
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                  (_model.apiResultAll6
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.town =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .town(
                                                                        (_model.apiResultAll6?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.townCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .townCount(
                                                                        (_model.apiResultAll6?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.town = [];
                                                              _model.townCount =
                                                                  [];
                                                            }
                                                          }),
                                                        ]);
                                                        _model.total =
                                                            EntertainerGroup
                                                                .gelAllEntertainerCall
                                                                .count(
                                                          (_model.apiResultAll6
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                .entertainerCategorySelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.entertainerCategoryValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.entertainerCategorySelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .entertainerCategoryValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .entertainerCategorySelectionsValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .entertainerCategoryValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .townSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.townValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.townSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .townValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .townValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .townSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .priceSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.priceValueController?.value = functions.priceTypeListNumberToStar(functions
                                                                    .findExactMatch1(
                                                                        functions
                                                                            .venueTypeList(_model.price.toList(),
                                                                                _model.priceCount.toList())
                                                                            ?.toList(),
                                                                        _model.priceSelected.toList())
                                                                    .toList())!;
                                                              });
                                                              safeSetState(() {
                                                                _model.priceChoiceChipsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .priceValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .priceValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .priceChoiceChipsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .rankSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.rankValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .rankSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.rankSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .rankValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .rankValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .rankSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .ageSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.ageValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.ageSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .ageValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .ageValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .ageSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                        ]);
                                                        _model.entertainerCategorySelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .entertainerCategoryValues
                                                                    ?.toList(),
                                                                _model
                                                                    .entertainerCategorySelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.priceSelected = functions
                                                            .combineAndReturnUnique1(
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceValues
                                                                        ?.toList())
                                                                    ?.toList(),
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceChoiceChipsValues
                                                                        ?.toList())
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.rankSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .rankValues
                                                                    ?.toList(),
                                                                _model
                                                                    .rankSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.ageSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model.ageValues
                                                                    ?.toList(),
                                                                _model
                                                                    .ageSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.townSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .townValues
                                                                    ?.toList(),
                                                                _model
                                                                    .townSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: true,
                                                    initialized: _model
                                                            .ageSelectionsValues !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .ageSelectionsValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      functions.findExactMatch(
                                                          functions
                                                              .venueTypeList(
                                                                  _model.age
                                                                      .toList(),
                                                                  _model
                                                                      .ageCount
                                                                      .toList())
                                                              ?.toList(),
                                                          _model.ageSelected
                                                              .toList()),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'siw4lmw9' /* less */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: true,
                                              tapBodyToCollapse: true,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .top,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_model.town.isNotEmpty)
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Container(
                                        color: Color(0x00000000),
                                        child: ExpandableNotifier(
                                          controller: _model
                                              .expandableExpandableController5,
                                          child: ExpandablePanel(
                                            header: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.houseUser,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'au8uwnju' /* Town */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMediumIsCustom,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            collapsed: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .prioritizeSelected(
                                                            functions
                                                                .findExactMatch(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList())
                                                                ?.toList(),
                                                            functions
                                                                .venueTypeList(
                                                                    _model.town
                                                                        .toList(),
                                                                    _model
                                                                        .townCount
                                                                        .toList())
                                                                ?.toList())
                                                        .take(5)
                                                        .toList()
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                          .townValues = val);
                                                      safeSetState(() {
                                                        _model.townSelectionsValueController
                                                                ?.value =
                                                            _model.townValues!;
                                                      });
                                                      _model.townSelected = functions
                                                          .combineAndReturnUnique1(
                                                              _model.townValues
                                                                  ?.toList(),
                                                              _model
                                                                  .townSelectionsValues
                                                                  ?.toList())
                                                          .toList()
                                                          .cast<String>();
                                                      _model.apiResultAll17 =
                                                          await EntertainerGroup
                                                              .gelAllEntertainerCall
                                                              .call(
                                                        filterQuery: functions.entertainerFilterInputFunction(
                                                            functions.distanceSelectionConverter(
                                                                FFAppState()
                                                                    .distance),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .priceSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .rankSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .ageSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .townSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(
                                                                    _model.entertainerCategorySelected.toList())
                                                                ?.unique((e) => e)
                                                                .toList(),
                                                            widget.categoryId,
                                                            FFAppState().latitude,
                                                            FFAppState().longituade),
                                                        limit: '2',
                                                        query:
                                                            widget.serchQuery,
                                                        sortQueryJson: functions
                                                            .getSortingAttributes(
                                                                'relevance',
                                                                'desc'),
                                                      );

                                                      if ((_model.apiResultAll17
                                                              ?.succeeded ??
                                                          true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                      (_model.apiResultAll17
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                  (_model.apiResultAll17
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.rank =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ranking(
                                                                        (_model.apiResultAll17?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.rankCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .rankingCount(
                                                                        (_model.apiResultAll17?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.rank = [];
                                                              _model.rankCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                      (_model.apiResultAll17
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                  (_model.apiResultAll17
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.entertainerCategory =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategory(
                                                                        (_model.apiResultAll17?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.entertainerCategoryCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategoryCount(
                                                                        (_model.apiResultAll17?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.entertainerCategory =
                                                                  [];
                                                              _model.entertainerCategoryCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                      (_model.apiResultAll17
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                  (_model.apiResultAll17
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.age =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRange(
                                                                        (_model.apiResultAll17?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.ageCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRangeCount(
                                                                        (_model.apiResultAll17?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.age = [];
                                                              _model.ageCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                      (_model.apiResultAll17
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                  (_model.apiResultAll17
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.town =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .town(
                                                                        (_model.apiResultAll17?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.townCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .townCount(
                                                                        (_model.apiResultAll17?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.town = [];
                                                              _model.townCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                      (_model.apiResultAll17
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                  (_model.apiResultAll17
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.price = EntertainerGroup
                                                                  .gelAllEntertainerCall
                                                                  .priceyFactorName(
                                                                    (_model.apiResultAll17
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              _model.priceCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .priceyFactorCount(
                                                                        (_model.apiResultAll17?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.price = [];
                                                              _model.priceCount =
                                                                  [];
                                                            }
                                                          }),
                                                        ]);
                                                        _model.total =
                                                            EntertainerGroup
                                                                .gelAllEntertainerCall
                                                                .count(
                                                          (_model.apiResultAll17
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                .entertainerCategorySelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.entertainerCategoryValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.entertainerCategorySelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .entertainerCategoryValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .entertainerCategorySelectionsValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .entertainerCategoryValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .priceSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.priceValueController?.value = functions.priceTypeListNumberToStar(functions
                                                                    .findExactMatch1(
                                                                        functions
                                                                            .venueTypeList(_model.price.toList(),
                                                                                _model.priceCount.toList())
                                                                            ?.toList(),
                                                                        _model.priceSelected.toList())
                                                                    .toList())!;
                                                              });
                                                              safeSetState(() {
                                                                _model.priceChoiceChipsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .priceValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .priceValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .priceChoiceChipsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .rankSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.rankValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .rankSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.rankSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .rankValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .rankValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .rankSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .ageSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.ageValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.ageSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .ageValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .ageValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .ageSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .townSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.townValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.townSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .townValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .townValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .townSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                        ]);
                                                        _model.entertainerCategorySelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .entertainerCategoryValues
                                                                    ?.toList(),
                                                                _model
                                                                    .entertainerCategorySelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.priceSelected = functions
                                                            .combineAndReturnUnique1(
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceValues
                                                                        ?.toList())
                                                                    ?.toList(),
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceChoiceChipsValues
                                                                        ?.toList())
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.rankSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .rankValues
                                                                    ?.toList(),
                                                                _model
                                                                    .rankSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.ageSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model.ageValues
                                                                    ?.toList(),
                                                                _model
                                                                    .ageSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.townSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .townValues
                                                                    ?.toList(),
                                                                _model
                                                                    .townSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: true,
                                                    initialized:
                                                        _model.townValues !=
                                                            null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .townValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      functions.findExactMatch(
                                                          functions
                                                              .venueTypeList(
                                                                  _model.town
                                                                      .toList(),
                                                                  _model
                                                                      .townCount
                                                                      .toList())
                                                              ?.toList(),
                                                          _model.townSelected
                                                              .toList()),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'twh4cfpa' /* more */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            expanded: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: functions
                                                        .prioritizeSelected(
                                                            functions
                                                                .findExactMatch(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList())
                                                                ?.toList(),
                                                            functions
                                                                .venueTypeList(
                                                                    _model.town
                                                                        .toList(),
                                                                    _model
                                                                        .townCount
                                                                        .toList())
                                                                ?.toList())
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .townSelectionsValues =
                                                          val);
                                                      safeSetState(() {
                                                        _model.townValueController
                                                                ?.value =
                                                            _model
                                                                .townSelectionsValues!;
                                                      });
                                                      _model.townSelected = functions
                                                          .combineAndReturnUnique1(
                                                              _model.townValues
                                                                  ?.toList(),
                                                              _model
                                                                  .townSelectionsValues
                                                                  ?.toList())
                                                          .toList()
                                                          .cast<String>();
                                                      _model.apiResultAll7 =
                                                          await EntertainerGroup
                                                              .gelAllEntertainerCall
                                                              .call(
                                                        filterQuery: functions.entertainerFilterInputFunction(
                                                            functions.distanceSelectionConverter(
                                                                FFAppState()
                                                                    .distance),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .priceSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .rankSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .ageSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(_model
                                                                    .townSelected
                                                                    .toList())
                                                                ?.unique(
                                                                    (e) => e)
                                                                .toList(),
                                                            functions
                                                                .topFilterTypeSelectionConverter(
                                                                    _model.entertainerCategorySelected.toList())
                                                                ?.unique((e) => e)
                                                                .toList(),
                                                            widget.categoryId,
                                                            FFAppState().latitude,
                                                            FFAppState().longituade),
                                                        limit: '2',
                                                        query:
                                                            widget.serchQuery,
                                                        sortQueryJson: functions
                                                            .getSortingAttributes(
                                                                'relevance',
                                                                'desc'),
                                                      );

                                                      if ((_model.apiResultAll7
                                                              ?.succeeded ??
                                                          true)) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                      (_model.apiResultAll7
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ranking(
                                                                  (_model.apiResultAll7
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.rank =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ranking(
                                                                        (_model.apiResultAll7?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.rankCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .rankingCount(
                                                                        (_model.apiResultAll7?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.rank = [];
                                                              _model.rankCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                      (_model.apiResultAll7
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .entserviceprovidercategory(
                                                                  (_model.apiResultAll7
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.entertainerCategory =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategory(
                                                                        (_model.apiResultAll7?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.entertainerCategoryCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .entserviceprovidercategoryCount(
                                                                        (_model.apiResultAll7?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.entertainerCategory =
                                                                  [];
                                                              _model.entertainerCategoryCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                      (_model.apiResultAll7
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .ageRange(
                                                                  (_model.apiResultAll7
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.age =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRange(
                                                                        (_model.apiResultAll7?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.ageCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .ageRangeCount(
                                                                        (_model.apiResultAll7?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.age = [];
                                                              _model.ageCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                      (_model.apiResultAll7
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .town(
                                                                  (_model.apiResultAll7
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.town =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .town(
                                                                        (_model.apiResultAll7?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                              _model.townCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .townCount(
                                                                        (_model.apiResultAll7?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.town = [];
                                                              _model.townCount =
                                                                  [];
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                      (_model.apiResultAll7
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    null &&
                                                                (EntertainerGroup
                                                                        .gelAllEntertainerCall
                                                                        .priceyFactorName(
                                                                  (_model.apiResultAll7
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))!
                                                                    .isNotEmpty) {
                                                              _model.price = EntertainerGroup
                                                                  .gelAllEntertainerCall
                                                                  .priceyFactorName(
                                                                    (_model.apiResultAll7
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                              _model.priceCount =
                                                                  EntertainerGroup
                                                                      .gelAllEntertainerCall
                                                                      .priceyFactorCount(
                                                                        (_model.apiResultAll7?.jsonBody ??
                                                                            ''),
                                                                      )!
                                                                      .toList()
                                                                      .cast<
                                                                          int>();
                                                            } else {
                                                              _model.price = [];
                                                              _model.priceCount =
                                                                  [];
                                                            }
                                                          }),
                                                        ]);
                                                        _model.total =
                                                            EntertainerGroup
                                                                .gelAllEntertainerCall
                                                                .count(
                                                          (_model.apiResultAll7
                                                                  ?.jsonBody ??
                                                              ''),
                                                        );
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                .entertainerCategorySelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.entertainerCategoryValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.entertainerCategory
                                                                                .toList(),
                                                                            _model.entertainerCategoryCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .entertainerCategorySelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.entertainerCategorySelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .entertainerCategoryValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .entertainerCategorySelectionsValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .entertainerCategoryValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .priceSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.priceValueController?.value = functions.priceTypeListNumberToStar(functions
                                                                    .findExactMatch1(
                                                                        functions
                                                                            .venueTypeList(_model.price.toList(),
                                                                                _model.priceCount.toList())
                                                                            ?.toList(),
                                                                        _model.priceSelected.toList())
                                                                    .toList())!;
                                                              });
                                                              safeSetState(() {
                                                                _model.priceChoiceChipsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .priceValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .priceValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .priceChoiceChipsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .rankSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.rankValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.rank
                                                                                .toList(),
                                                                            _model.rankCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .rankSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.rankSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .rankValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .rankValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .rankSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .ageSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.ageValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.age
                                                                                .toList(),
                                                                            _model.ageCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .ageSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.ageSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .ageValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .ageValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .ageSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                .townSelected
                                                                .isNotEmpty) {
                                                              safeSetState(() {
                                                                _model.townValueController?.value = functions.findExactMatch1(
                                                                    functions
                                                                        .venueTypeList(
                                                                            _model.town
                                                                                .toList(),
                                                                            _model.townCount
                                                                                .toList())
                                                                        ?.toList(),
                                                                    _model
                                                                        .townSelected
                                                                        .toList());
                                                              });
                                                              safeSetState(() {
                                                                _model.townSelectionsValueController
                                                                        ?.value =
                                                                    _model
                                                                        .townValues!;
                                                              });
                                                            } else {
                                                              safeSetState(() => _model
                                                                  .townValueController
                                                                  ?.value = []);
                                                              safeSetState(() => _model
                                                                  .townSelectionsValueController
                                                                  ?.value = []);
                                                            }
                                                          }),
                                                        ]);
                                                        _model.entertainerCategorySelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .entertainerCategoryValues
                                                                    ?.toList(),
                                                                _model
                                                                    .entertainerCategorySelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.priceSelected = functions
                                                            .combineAndReturnUnique1(
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceValues
                                                                        ?.toList())
                                                                    ?.toList(),
                                                                functions
                                                                    .priceTypeListStarToNumber(_model
                                                                        .priceChoiceChipsValues
                                                                        ?.toList())
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.rankSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .rankValues
                                                                    ?.toList(),
                                                                _model
                                                                    .rankSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.ageSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model.ageValues
                                                                    ?.toList(),
                                                                _model
                                                                    .ageSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        _model.townSelected = functions
                                                            .combineAndReturnUnique1(
                                                                _model
                                                                    .townValues
                                                                    ?.toList(),
                                                                _model
                                                                    .townSelectionsValues
                                                                    ?.toList())
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          Color(0x00000000),
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: true,
                                                    initialized: _model
                                                            .townSelectionsValues !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .townSelectionsValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      functions.findExactMatch(
                                                          functions
                                                              .venueTypeList(
                                                                  _model.town
                                                                      .toList(),
                                                                  _model
                                                                      .townCount
                                                                      .toList())
                                                              ?.toList(),
                                                          _model.townSelected
                                                              .toList()),
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 6.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'qrjjx59f' /* less */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            theme: ExpandableThemeData(
                                              tapHeaderToExpand: true,
                                              tapBodyToExpand: true,
                                              tapBodyToCollapse: true,
                                              headerAlignment:
                                                  ExpandablePanelHeaderAlignment
                                                      .top,
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(height: 7.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Show ${valueOrDefault<String>(
                                    _model.total?.toString(),
                                    ' no ',
                                  )}  results',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(
                                        context,
                                        FilterSelectionDataStruct(
                                          venueTypeSelections:
                                              functions.combineAndReturnUnique(
                                                  _model
                                                      .entertainerCategoryValues
                                                      ?.toList(),
                                                  _model
                                                      .entertainerCategorySelectionsValues
                                                      ?.toList()),
                                          ageRangeSelections:
                                              functions.combineAndReturnUnique(
                                                  _model.ageValues?.toList(),
                                                  _model.ageSelectionsValues
                                                      ?.toList()),
                                          townSelections:
                                              functions.combineAndReturnUnique(
                                                  _model.townValues?.toList(),
                                                  _model.townSelectionsValues
                                                      ?.toList()),
                                          priceFactorSelections:
                                              functions.combineAndReturnUnique(
                                                  functions
                                                      .priceTypeListStarToNumber(
                                                          _model.priceValues
                                                              ?.toList())
                                                      ?.toList(),
                                                  functions
                                                      .priceTypeListStarToNumber(
                                                          _model
                                                              .priceChoiceChipsValues
                                                              ?.toList())
                                                      ?.toList()),
                                          rankingSelections:
                                              functions.combineAndReturnUnique(
                                                  _model.rankValues?.toList(),
                                                  _model.rankSelectionsValues
                                                      ?.toList()),
                                        ));
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'a2gqo8lq' /* Apply all */,
                                  ),
                                  icon: Icon(
                                    Icons.app_shortcut_rounded,
                                    size: 16.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (!functions.checkListOfDynamic(
                    EntertainerGroup.gelAllEntertainerCall.aggBuckets(
                  (_model.apiResultAll?.jsonBody ?? ''),
                )))
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: wrapWithModel(
                        model: _model.filterNotFoundCompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: FilterNotFoundCompWidget(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
