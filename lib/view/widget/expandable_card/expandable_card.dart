import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_play_chess/view/theme/expandable_card_theme_data.dart';
import 'package:logger/logger.dart';

class ExpandableCard extends StatefulWidget {
  final Widget header;
  final ExpandableCardThemeData? expandableCardThemeData;
  final dynamic Function()? onTap;
  final bool showStatusIcon;
  final bool initialPressed;
  final bool isSelected;
  final bool closedFullHeight;
  final Widget? expandedContent;

  const ExpandableCard(
      {Key? key,
      this.expandableCardThemeData,
      required this.onTap,
      this.initialPressed = true,
      required this.header,
      required this.expandedContent,
      required this.isSelected,
      this.closedFullHeight = false,
      this.showStatusIcon = false})
      : super(key: key);

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard>
    with MaterialStateMixin, TickerProviderStateMixin {
  static final Animatable<double> _easeInOutTween =
      CurveTween(curve: Curves.easeInOut);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  late bool pressed;
  late final AnimationController _controller;

  late final Animation<double> _contentAnimation;

  late Animation<double> _iconTurns;

  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    // effective
    ExpandableCardThemeData themeData = Theme.of(context)
        .extension<ExpandableCardThemeData>()!
        .merge(widget.expandableCardThemeData) as ExpandableCardThemeData;

    resolveWidgetMaterialState();
    if (widget.expandedContent != null) {
      if (materialStates.contains(MaterialState.pressed)) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(10.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: themeData.headerDecoration!.resolve(materialStates),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity: widget.isSelected ? 0.2 : 0.0,
                      child: themeData.decorationImage != null &&
                              themeData.decorationImage!.call() != null
                          ? Image(
                              image: themeData.decorationImage!.call()!,
                              fit: BoxFit.cover,
                            )
                          : null,
                      duration: Duration(milliseconds: 300),
                    ),
                  ),
                  Positioned(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: widget.onTap != null
                              ? widget.expandedContent != null
                                  ? widget.isSelected
                                      ? () {
                                          setState(() {
                                            pressed = !pressed;
                                          });
                                        }
                                      : () {
                                          widget.onTap!();
                                          pressed = true;
                                        }
                                  : widget.onTap
                              : null,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: themeData.collapsedPadding ??
                                    EdgeInsets.zero,
                                child: ConstrainedBox(
                                  constraints: themeData.collapsedConstraints ??
                                      const BoxConstraints(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AnimatedDefaultTextStyle(
                                              child: widget.header,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .merge(themeData
                                                      .headerTextStyle!
                                                      .resolve(
                                                          materialStates)!),
                                              duration:
                                                  Duration(milliseconds: 300)),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 21),
                                            child: _buildIcon(themeData),
                                          )
                                        ],
                                      ),
                                      /*
                                        AnimatedSwitcher(
                                        duration: Duration(milliseconds: 300),
                                        transitionBuilder: (child, animation) =>
                                            SizeTransition(
                                          axis: Axis.vertical,
                                          sizeFactor: _contentAnimation,
                                          child: Column(
                                            children: [
                                              widget.description != null
                                                  ? SizedBox(
                                                      width: 20,
                                                    )
                                                  : SizedBox.shrink(),
                                              child
                                            ],
                                          ),
                                        ),
                                        child: widget.description ??
                                            SizedBox.shrink(),
                                      ),
                                       */
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => SizeTransition(
                      axis: Axis.vertical,
                      sizeFactor: _contentAnimation,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration:
                            themeData.decoration!.resolve(materialStates),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Center(child: child),
                        ),
                        //color: Colors.white,
                        //constraints: BoxConstraints(),
                      ),
                    ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: themeData.contentPadding ?? EdgeInsets.zero,
                    child: DefaultTextStyle(
                      child: widget.expandedContent ?? SizedBox.shrink(),
                      style: Theme.of(context)
                          .extension<ExpandableCardThemeData>()!
                          .contentTextStyle!
                          .resolve(materialStates)!,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _iconTurns = _controller.drive(_halfTween.chain(_easeInOutTween));

    _contentAnimation = _controller.drive(_easeInOutTween);

    if (widget.expandedContent == null) {
      pressed = false;
    } else {
      pressed = widget.initialPressed && widget.isSelected;
    }
    // CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // );

    super.initState();
  }

  BoxDecoration resolveDecoration() {
    return Theme.of(context)
        .extension<ExpandableCardThemeData>()!
        .decoration!
        .resolve(materialStates)!;
  }

  TextStyle resolveText() {
    return Theme.of(context)
        .extension<ExpandableCardThemeData>()!
        .headerTextStyle!
        .resolve(materialStates)!;
  }

  void resolveWidgetMaterialState() {
    //logger.e(widget.isPressed);

    pressed = pressed && widget.isSelected;
    if (widget.onTap == null) {
      addMaterialState(MaterialState.disabled);
    } else {
      removeMaterialState(MaterialState.disabled);
    }
    if (widget.isSelected) {
      addMaterialState(MaterialState.selected);
    } else {
      removeMaterialState(MaterialState.pressed);
      removeMaterialState(MaterialState.selected);
    }
    if (pressed) {
      addMaterialState(MaterialState.pressed);
    } else {
      removeMaterialState(MaterialState.pressed);
    }
    //logger.d("Current material states: $materialStates");
  }

  Widget _buildIcon(ExpandableCardThemeData themeData) {
    return widget.showStatusIcon == true
        ? RotationTransition(
            turns: _iconTurns,
            child: Icon(
              Icons.expand_more,
              color: themeData.iconColor!.resolve(materialStates),
            ),
          )
        : SizedBox.shrink();
  }
}
