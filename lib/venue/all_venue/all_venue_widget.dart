import '/backend/api_requests/api_calls.dart';
import '/components/distance_comp_widget.dart';
import '/components/error_compoent_widget.dart';
import '/components/map_venue_widget.dart';
import '/components/place_activity_comp_widget.dart';
import '/components/venue_filter_comp_widget.dart';
import '/components/view_by_comp_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'all_venue_model.dart';
export 'all_venue_model.dart';

class AllVenueWidget extends StatefulWidget {
  const AllVenueWidget({
    super.key,
    this.venueSearchQuery,
    String? sortoder,
    String? viewby,
    bool? showmm,
  })  : sortoder = sortoder ?? 'ASC',
        viewby = viewby ?? 'relevance',
        showmm = showmm ?? true;

  final String? venueSearchQuery;
  final String sortoder;
  final String viewby;
  final bool showmm;

  @override
  State<AllVenueWidget> createState() => _AllVenueWidgetState();
}

class _AllVenueWidgetState extends State<AllVenueWidget> {
  late AllVenueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool searchFieldFocusListenerRegistered = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllVenueModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.searchuery = widget.venueSearchQuery!;
      _model.showSerchResult = false;
      FFAppState().visibalMap = false;
    });

    _model.searchFieldTextController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter2 ??= Completer<ApiCallResponse>()
            ..complete(VenuesGroup.getAllVenuesCall.call(
              searchText: _model.searchuery,
              limit: 5,
              filters: functions.filterInputFunctionc(
                  valueOrDefault<String>(
                    functions.distanceSelectionConverter(
                        _model.distanceSelectionOutput != null &&
                                _model.distanceSelectionOutput != ''
                            ? _model.distanceSelectionOutput!
                            : '55'),
                    '25',
                  ),
                  functions
                      .venuTypeSelectionConverter(
                          _model.venueAggregation.toList())
                      ?.toList(),
                  functions
                      .venuTypeSelectionConverter(
                          _model.activityTypeAggregation.toList())
                      ?.toList(),
                  functions
                      .venuTypeSelectionConverter(
                          _model.sportstypeAggregation.toList())
                      ?.toList(),
                  functions
                      .venuTypeSelectionConverter(
                          _model.pricefactorAggregation.toList())
                      ?.toList(),
                  functions
                      .venuTypeSelectionConverter(
                          _model.rankingAggregation.toList())
                      ?.toList(),
                  functions
                      .venuTypeSelectionConverter(
                          _model.ageRangeAggregation.toList())
                      ?.toList(),
                  functions
                      .venuTypeSelectionConverter(
                          _model.townAggregation.toList())
                      ?.toList(),
                  functions
                      .venuTypeSelectionConverter(
                          _model.capacityAggregation.toList())
                      ?.toList(),
                  functions
                      .venuTypeSelectionConverter(
                          _model.demographicsAggregation.toList())
                      ?.toList(),
                  _model.placeSelectionOutput),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 20.0,
                ),
              ),
            ),
          );
        }
        final allVenueGetAllVenuesResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              iconTheme: IconThemeData(
                  color: FlutterFlowTheme.of(context).primaryText),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 20.0,
                buttonSize: 24.0,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 32.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'HomePage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                      ),
                    },
                  );
                },
              ),
              actions: [
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    borderRadius: 20.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.tune_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      _model.venueAggregation = [''];
                      _model.activityTypeAggregation = [''];
                      _model.townAggregation = [''];
                      _model.activityCategoryAggregation = [''];
                      _model.sportstypeAggregation = [''];
                      _model.capacityAggregation = [''];
                      _model.rankingAggregation = [''];
                      _model.pricefactorAggregation = [''];
                      _model.demographicsAggregation = [''];
                      _model.ageRangeAggregation = [''];
                      setState(() => _model.apiRequestCompleter2 = null);
                      await _model.waitForApiRequestCompleted2();
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: const AlignmentDirectional(0.0, 1.0)
                                .resolve(Directionality.of(context)),
                            child: GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: SizedBox(
                                height: double.infinity,
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                child: VenueFilterCompWidget(
                                  venueType: VenuesGroup.getAllVenuesCall
                                      .venueTypeName(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  venueCount: VenuesGroup.getAllVenuesCall
                                      .venueTypeCount(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  activityType:
                                      VenuesGroup.getAllVenuesCall.activitytype(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  activityCount: VenuesGroup.getAllVenuesCall
                                      .activitytypeCount(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  sportType:
                                      VenuesGroup.getAllVenuesCall.sportstype(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  sportTypeCount: VenuesGroup.getAllVenuesCall
                                      .sportstypeCount(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  price:
                                      VenuesGroup.getAllVenuesCall.priceyfactor(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  rank: VenuesGroup.getAllVenuesCall.ranking(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  rankCount:
                                      VenuesGroup.getAllVenuesCall.rankingCount(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  age: VenuesGroup.getAllVenuesCall.agerange(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  ageCount: VenuesGroup.getAllVenuesCall
                                      .agerangeCount(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  town: VenuesGroup.getAllVenuesCall.town(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  townCount:
                                      VenuesGroup.getAllVenuesCall.townCount(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  capacity:
                                      VenuesGroup.getAllVenuesCall.capacity(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  capacityCount: VenuesGroup.getAllVenuesCall
                                      .capacityCount(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  gender:
                                      VenuesGroup.getAllVenuesCall.demographics(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  genderCount: VenuesGroup.getAllVenuesCall
                                      .demographicsCount(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  activityCatgory: VenuesGroup.getAllVenuesCall
                                      .activitycategory(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  activityCatgoryCount: VenuesGroup
                                      .getAllVenuesCall
                                      .activitycategoryCount(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                  priceCount: VenuesGroup.getAllVenuesCall
                                      .priceyfactorCount(
                                    allVenueGetAllVenuesResponse.jsonBody,
                                  )!,
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) =>
                          safeSetState(() => _model.aggreSelection = value));

                      _model.venueAggregation = _model
                          .aggreSelection!.venueTypeSelections
                          .toList()
                          .cast<String>();
                      _model.activityTypeAggregation = _model
                          .aggreSelection!.activityTypeSelections
                          .toList()
                          .cast<String>();
                      _model.sportstypeAggregation = _model
                          .aggreSelection!.sportTypeSelections
                          .toList()
                          .cast<String>();
                      _model.pricefactorAggregation = _model
                          .aggreSelection!.priceFactorSelections
                          .toList()
                          .cast<String>();
                      _model.townAggregation = _model
                          .aggreSelection!.townSelections
                          .toList()
                          .cast<String>();
                      _model.activityCategoryAggregation = _model
                          .aggreSelection!.activityTypeCategorySelections
                          .toList()
                          .cast<String>();
                      _model.capacityAggregation = _model
                          .aggreSelection!.capacitySelections
                          .toList()
                          .cast<String>();
                      _model.rankingAggregation = _model
                          .aggreSelection!.rankingSelections
                          .toList()
                          .cast<String>();
                      _model.demographicsAggregation = _model
                          .aggreSelection!.demographicsSelections
                          .toList()
                          .cast<String>();
                      _model.ageRangeAggregation = _model
                          .aggreSelection!.ageRangeSelections
                          .toList()
                          .cast<String>();
                      setState(() =>
                          _model.venueListViewPagingController?.refresh());
                      await _model.waitForOnePageForVenueListView();

                      setState(() {});
                    },
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  height: 43.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          _model.showSerchResult.toString(),
                          'c',
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Text(
                          '(${_model.totlcount == '' ? VenuesGroup.getAllVenuesCall.searchCount(
                                allVenueGetAllVenuesResponse.jsonBody,
                              )?.toString() : _model.totlcount}results)',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                decoration: const BoxDecoration(),
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 7.0, 0.0),
                              child: Autocomplete<String>(
                                initialValue: const TextEditingValue(),
                                optionsBuilder: (textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }
                                  return ['Option 1'].where((option) {
                                    final lowercaseOption =
                                        option.toLowerCase();
                                    return lowercaseOption.contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                optionsViewBuilder:
                                    (context, onSelected, options) {
                                  return AutocompleteOptionsList(
                                    textFieldKey: _model.searchFieldKey,
                                    textController:
                                        _model.searchFieldTextController!,
                                    options: options.toList(),
                                    onSelected: onSelected,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    textHighlightStyle: const TextStyle(),
                                    elevation: 4.0,
                                    optionBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    optionHighlightColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    maxHeight: 200.0,
                                  );
                                },
                                onSelected: (String selection) {
                                  setState(() => _model
                                      .searchFieldSelectedOption = selection);
                                  FocusScope.of(context).unfocus();
                                },
                                fieldViewBuilder: (
                                  context,
                                  textEditingController,
                                  focusNode,
                                  onEditingComplete,
                                ) {
                                  _model.searchFieldFocusNode = focusNode;
                                  if (!searchFieldFocusListenerRegistered) {
                                    searchFieldFocusListenerRegistered = true;
                                    _model.searchFieldFocusNode!
                                        .addListener(() => setState(() {}));
                                  }
                                  _model.searchFieldTextController =
                                      textEditingController;
                                  return TextFormField(
                                    key: _model.searchFieldKey,
                                    controller: textEditingController,
                                    focusNode: focusNode,
                                    onEditingComplete: onEditingComplete,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.searchFieldTextController',
                                      const Duration(milliseconds: 2000),
                                      () async {
                                        _model.showSerchResult = _model.searchFieldTextController
                                                    .text !=
                                                '';
                                        _model.searchuery = _model.searchFieldTextController
                                                        .text !=
                                                    ''
                                            ? _model
                                                .searchFieldTextController.text
                                            : '*';
                                        setState(() =>
                                            _model.apiRequestCompleter2 = null);
                                        await _model
                                            .waitForApiRequestCompleted2();
                                        setState(() => _model
                                            .venueListViewPagingController
                                            ?.refresh());
                                        await _model
                                            .waitForOnePageForVenueListView();
                                      },
                                    ),
                                    onFieldSubmitted: (_) async {
                                      _model.searchuery = _model.searchFieldTextController
                                                      .text !=
                                                  ''
                                          ? _model
                                              .searchFieldTextController.text
                                          : '*';
                                      _model.showSerchResult = false;
                                      setState(() =>
                                          _model.apiRequestCompleter2 = null);
                                      await _model
                                          .waitForApiRequestCompleted2();
                                      setState(() => _model
                                          .venueListViewPagingController
                                          ?.refresh());
                                      await _model
                                          .waitForOnePageForVenueListView();
                                    },
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Search',
                                      hintText: 'Search for venues...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.search_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 21.0,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    validator: _model
                                        .searchFieldTextControllerValidator
                                        .asValidator(context),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: const AlignmentDirectional(
                                                        0.0, 1.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: const SizedBox(
                                                    width: double.infinity,
                                                    child: DistanceCompWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.distanceSelectionOutput =
                                                  value));

                                          setState(() => _model
                                              .venueListViewPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForVenueListView();
                                          setState(() => _model
                                              .apiRequestCompleter2 = null);
                                          await _model
                                              .waitForApiRequestCompleted2();
                                          _model.totlcount =
                                              VenuesGroup.getAllVenuesCall
                                                  .searchCount(
                                                    allVenueGetAllVenuesResponse
                                                        .jsonBody,
                                                  )!
                                                  .toString();

                                          setState(() {});
                                        },
                                        text: 'Distance',
                                        icon: const FaIcon(
                                          FontAwesomeIcons.streetView,
                                          size: 20.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 31.04,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          iconPadding: const EdgeInsets.all(0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: const AlignmentDirectional(
                                                        0.0, 1.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: SizedBox(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.35,
                                                    width: double.infinity,
                                                    child: const ViewByCompWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.viewSelectionOutput =
                                                  value));

                                          setState(() => _model
                                              .venueListViewPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForVenueListView();

                                          setState(() {});
                                        },
                                        text: 'Filters',
                                        icon: const FaIcon(
                                          FontAwesomeIcons.sort,
                                          size: 17.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 31.04,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          iconPadding: const EdgeInsets.all(0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: const AlignmentDirectional(
                                                        0.0, 1.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: const SizedBox(
                                                    width: double.infinity,
                                                    child:
                                                        PlaceActivityCompWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.placeSelectionOutput =
                                                  value));

                                          setState(() => _model
                                              .venueListViewPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForVenueListView();
                                          _model.totlcount =
                                              VenuesGroup.getAllVenuesCall
                                                  .searchCount(
                                                    allVenueGetAllVenuesResponse
                                                        .jsonBody,
                                                  )!
                                                  .toString();

                                          setState(() {});
                                        },
                                        text: 'Place/Activity',
                                        icon: const FaIcon(
                                          FontAwesomeIcons.solidPaperPlane,
                                          size: 17.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 31.04,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          iconPadding: const EdgeInsets.all(0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 8.0)),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: RefreshIndicator(
                                  onRefresh: () async {
                                    setState(() => _model
                                        .venueListViewPagingController
                                        ?.refresh());
                                    await _model
                                        .waitForOnePageForVenueListView();
                                  },
                                  child:
                                      PagedListView<ApiPagingParams, dynamic>(
                                    pagingController:
                                        _model.setVenueListViewController(
                                      (nextPageMarker) =>
                                          VenuesGroup.getAllVenuesCall.call(
                                        filters: functions.filterInputFunctionc(
                                            valueOrDefault<String>(
                                              functions.distanceSelectionConverter(
                                                  _model.distanceSelectionOutput !=
                                                              null &&
                                                          _model.distanceSelectionOutput !=
                                                              ''
                                                      ? _model
                                                          .distanceSelectionOutput!
                                                      : '55'),
                                              '25',
                                            ),
                                            functions
                                                .venuTypeSelectionConverter(
                                                    _model.venueAggregation
                                                        .toList())
                                                ?.toList(),
                                            functions
                                                .venuTypeSelectionConverter(_model
                                                    .activityTypeAggregation
                                                    .toList())
                                                ?.toList(),
                                            functions
                                                .venuTypeSelectionConverter(
                                                    _model.sportstypeAggregation
                                                        .toList())
                                                ?.toList(),
                                            functions
                                                .venuTypeSelectionConverter(
                                                    _model.pricefactorAggregation
                                                        .toList())
                                                ?.toList(),
                                            functions
                                                .venuTypeSelectionConverter(
                                                    _model.rankingAggregation
                                                        .toList())
                                                ?.toList(),
                                            functions
                                                .venuTypeSelectionConverter(
                                                    _model.ageRangeAggregation
                                                        .toList())
                                                ?.toList(),
                                            functions
                                                .venuTypeSelectionConverter(_model.townAggregation
                                                    .toList())
                                                ?.toList(),
                                            functions
                                                .venuTypeSelectionConverter(
                                                    _model.capacityAggregation
                                                        .toList())
                                                ?.toList(),
                                            functions
                                                .venuTypeSelectionConverter(
                                                    _model.demographicsAggregation.toList())
                                                ?.toList(),
                                            _model.placeSelectionOutput),
                                        startIndex:
                                            nextPageMarker.nextPageNumber * 20,
                                        pageNumber:
                                            nextPageMarker.nextPageNumber + 1,
                                        sortOrderType: valueOrDefault<String>(
                                          functions.viewByConverter(
                                              _model.viewSelectionOutput != null
                                                  ? _model.viewSelectionOutput
                                                      ?.viewSelection
                                                  : 'Relevance'),
                                          'Relevance',
                                        ),
                                        sortOrder:
                                            _model.viewSelectionOutput != null
                                                ? _model.viewSelectionOutput
                                                    ?.sortSelection
                                                : 'desc',
                                        searchText: _model.searchuery,
                                        limit: 20,
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                    reverse: false,
                                    scrollDirection: Axis.vertical,
                                    builderDelegate:
                                        PagedChildBuilderDelegate<dynamic>(
                                      // Customize what your widget looks like when it's loading the first page.
                                      firstPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 20.0,
                                          height: 20.0,
                                          child: SpinKitRing(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      // Customize what your widget looks like when it's loading another page.
                                      newPageProgressIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width: 20.0,
                                          height: 20.0,
                                          child: SpinKitRing(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                      noItemsFoundIndicatorBuilder: (_) =>
                                          Center(
                                        child: SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.9,
                                          child: const ErrorCompoentWidget(),
                                        ),
                                      ),
                                      itemBuilder:
                                          (context, _, eachVenueIndex) {
                                        final eachVenueItem = _model
                                            .venueListViewPagingController!
                                            .itemList![eachVenueIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 16.0, 16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 12.0,
                                                          12.0, 12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 118.0,
                                                            height: 130.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                    child: Image
                                                                        .network(
                                                                      getJsonField(
                                                                        eachVenueItem,
                                                                        r'''$.logo''',
                                                                      ).toString(),
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          104.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.jpeg',
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            104.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'VenueDetails',
                                                                      queryParameters:
                                                                          {
                                                                        'venueId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            eachVenueItem,
                                                                            r'''$._id''',
                                                                          ),
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  text:
                                                                      'More Info',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 97.0,
                                                                    height:
                                                                        19.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height: 3.0)),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      eachVenueItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    getJsonField(
                                                                      eachVenueItem,
                                                                      r'''$.address''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          eachVenueItem,
                                                                          r'''$.overallRank''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .star_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    getJsonField(
                                                                      eachVenueItem,
                                                                      r'''$['venueMoreFields-_-price']''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    'Venue Type :${getJsonField(
                                                                      eachVenueItem,
                                                                      r'''$.venueType''',
                                                                    ).toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    'Type :${getJsonField(
                                                                          eachVenueItem,
                                                                          r'''$['venueMoreFields-_-sportsType']''',
                                                                        ) != null ? getJsonField(
                                                                        eachVenueItem,
                                                                        r'''$['venueMoreFields-_-sportsType']''',
                                                                      ).toString() : '   '}${getJsonField(
                                                                      eachVenueItem,
                                                                      r'''$['venueMoreFields-_-activityType']''',
                                                                    ).toString()}${'celebratix://celebratix.com${GoRouterState.of(context).uri.toString()}'}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_model.showSerchResult)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 59.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: FutureBuilder<ApiCallResponse>(
                              future: VenuesGroup.venueSuggestionCall.call(
                                searchVenueQuery:
                                    _model.searchFieldTextController.text,
                                uiContext: valueOrDefault<String>(
                                  functions.suggestionCursorInput(
                                      valueOrDefault<String>(
                                        _model.searchFieldTextController.text,
                                        'CupCake',
                                      ),
                                      valueOrDefault<String>(
                                        functions.distanceSelectionConverter(
                                            _model.distanceSelectionOutput !=
                                                        null &&
                                                    _model.distanceSelectionOutput !=
                                                        ''
                                                ? _model
                                                    .distanceSelectionOutput!
                                                : '55'),
                                        '25',
                                      ),
                                      42.4597,
                                      -71.0638,
                                      valueOrDefault<String>(
                                        _model.placeSelectionOutput,
                                        '1',
                                      )),
                                  '2',
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: SpinKitRing(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                    ),
                                  );
                                }
                                final listViewVenueSuggestionResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final suggestions =
                                        VenuesGroup.venueSuggestionCall
                                                .key(
                                                  listViewVenueSuggestionResponse
                                                      .jsonBody,
                                                )
                                                ?.unique((e) => e)
                                                .toList() ??
                                            [];
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: suggestions.length,
                                      itemBuilder: (context, suggestionsIndex) {
                                        final suggestionsItem =
                                            suggestions[suggestionsIndex];
                                        return Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 10.0, 0.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model
                                                      .searchFieldTextController
                                                      ?.text = suggestionsItem;
                                                });
                                                _model.searchuery = _model.searchFieldTextController
                                                                .text !=
                                                            ''
                                                    ? _model
                                                        .searchFieldTextController
                                                        .text
                                                    : '*';
                                                _model.showSerchResult = false;
                                                setState(() => _model
                                                        .apiRequestCompleter2 =
                                                    null);
                                                await _model
                                                    .waitForApiRequestCompleted2();
                                                setState(() => _model
                                                    .venueListViewPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForVenueListView();
                                              },
                                              child: Text(
                                                suggestionsItem,
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 25.0, 20.0),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 51.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: FaIcon(
                                FontAwesomeIcons.map,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 1.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.8,
                                          child: MapVenueWidget(
                                            filter:
                                                functions.filterInputFunctionc(
                                                    valueOrDefault<String>(
                                                      functions.distanceSelectionConverter(
                                                          _model.distanceSelectionOutput !=
                                                                      null &&
                                                                  _model.distanceSelectionOutput !=
                                                                      ''
                                                              ? _model
                                                                  .distanceSelectionOutput!
                                                              : '55'),
                                                      '25',
                                                    ),
                                                    functions
                                                        .venuTypeSelectionConverter(
                                                            _model
                                                                .venueAggregation
                                                                .toList())
                                                        ?.toList(),
                                                    functions
                                                        .venuTypeSelectionConverter(
                                                            _model
                                                                .activityTypeAggregation
                                                                .toList())
                                                        ?.toList(),
                                                    functions
                                                        .venuTypeSelectionConverter(
                                                            _model
                                                                .sportstypeAggregation
                                                                .toList())
                                                        ?.toList(),
                                                    functions
                                                        .venuTypeSelectionConverter(
                                                            _model
                                                                .pricefactorAggregation
                                                                .toList())
                                                        ?.toList(),
                                                    functions
                                                        .venuTypeSelectionConverter(
                                                            _model
                                                                .rankingAggregation
                                                                .toList())
                                                        ?.toList(),
                                                    functions
                                                        .venuTypeSelectionConverter(
                                                            _model
                                                                .ageRangeAggregation
                                                                .toList())
                                                        ?.toList(),
                                                    functions
                                                        .venuTypeSelectionConverter(
                                                            _model
                                                                .townAggregation
                                                                .toList())
                                                        ?.toList(),
                                                    functions
                                                        .venuTypeSelectionConverter(
                                                            _model
                                                                .capacityAggregation
                                                                .toList())
                                                        ?.toList(),
                                                    functions
                                                        .venuTypeSelectionConverter(
                                                            _model
                                                                .demographicsAggregation
                                                                .toList())
                                                        ?.toList(),
                                                    _model
                                                        .placeSelectionOutput),
                                            searchQuery: _model.searchuery,
                                            start: 0,
                                            pageNumber: 1,
                                            sortOrder:
                                                _model.viewSelectionOutput !=
                                                        null
                                                    ? _model.viewSelectionOutput
                                                        ?.sortSelection
                                                    : 'desc',
                                            sortOrderType:
                                                valueOrDefault<String>(
                                              functions.viewByConverter(
                                                  _model.viewSelectionOutput !=
                                                          null
                                                      ? _model
                                                          .viewSelectionOutput
                                                          ?.viewSelection
                                                      : 'Relevance'),
                                              'Relevance',
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                            ),
                          ),
                        ),
                      ),
                      if (FFAppState().visibalMap &&
                          responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(0.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 9.0, 9.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 52.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      icon: Icon(
                                        Icons.view_list_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        _model.showMap = false;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(0.05, 0.74),
                        child: Text(
                          _model.searchFieldTextController.text,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
