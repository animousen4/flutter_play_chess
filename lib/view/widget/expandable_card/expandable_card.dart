import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/theme/expandable_card_theme.dart';
import 'package:logger/logger.dart';

class ExpandableCard extends StatefulWidget {
  final Widget header;
  final ExpandableCardTheme? expandableCardThemeData;
  final dynamic Function()? onTap;
  final Widget? description;
  final bool showStatusIcon;
  final bool isPressed;
  final bool isSelected;
  final bool closedFullHeight;
  final Widget? expandedContent;
  final EdgeInsets contentPadding;
  final EdgeInsets collapsedPadding;

  const ExpandableCard(
      {Key? key,
      this.expandableCardThemeData,
      required this.onTap,
      required this.isPressed,
      required this.header,
      required this.description,
      required this.expandedContent,
      required this.isSelected,
      this.closedFullHeight = false,
      this.showStatusIcon = false,
      this.collapsedPadding =
          const EdgeInsets.only(top: 30, bottom: 20, left: 22, right: 22),
      this.contentPadding = EdgeInsets.zero})
      : super(key: key);

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class __ExpandFadeContainerState extends State<_ExpandFadeContainer> {
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: widget.sizeAnimation,
      child: FadeTransition(
        opacity: widget.fadeAnimation,
        child: widget.content,
      ),
    );
  }
}

class _ExpandableCardState extends State<ExpandableCard>
    with MaterialStateMixin, TickerProviderStateMixin {
  static final Animatable<double> _easeInOutTween =
      CurveTween(curve: Curves.easeInOut);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  late final AnimationController _controller;

  late final Animation<double> _contentAnimation;

  late Animation<double> _iconTurns;

  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    ExpandableCardTheme themeData = widget.expandableCardThemeData ??
        Theme.of(context).extension<ExpandableCardTheme>()!;

    resolveWidgetMaterialState();
    if (widget.expandedContent != null) {
      if (materialStates.contains(MaterialState.pressed)) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }

    final double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: widget.closedFullHeight ? screenWidth : widget.isSelected ? screenWidth : (screenWidth - 16 * 3) * 0.5,
      child: Material(
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
                        child: themeData.decorationImage != null
                            ? Image(
                                image: themeData.decorationImage!,
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
                            onTap: widget.onTap,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: widget.collapsedPadding,
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
                                              style: themeData.headerTextStyle!
                                                  .resolve(materialStates)!,
                                              duration:
                                                  Duration(milliseconds: 300)),
                                          _buildIcon(themeData)
                                        ],
                                      ),
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
                                    ],
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
                      padding: widget.contentPadding,
                      child: DefaultTextStyle(
                        child: widget.expandedContent ?? SizedBox.shrink(),
                        style: Theme.of(context)
                            .extension<ExpandableCardTheme>()!
                            .contentTextStyle!
                            .resolve(materialStates)!,
                      ),
                    ),
                  )),
            ],
          ),
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

    // CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // );

    super.initState();
  }

  BoxDecoration resolveDecoration() {
    return Theme.of(context)
        .extension<ExpandableCardTheme>()!
        .decoration!
        .resolve(materialStates)!;
  }

  TextStyle resolveText() {
    return Theme.of(context)
        .extension<ExpandableCardTheme>()!
        .headerTextStyle!
        .resolve(materialStates)!;
  }

  void resolveWidgetMaterialState() {
    //logger.e(widget.isPressed);
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
    if (widget.isPressed) {
      addMaterialState(MaterialState.pressed);
    } else {
      removeMaterialState(MaterialState.pressed);
    }
    //logger.d("Current material states: $materialStates");
  }

  Widget _buildIcon(ExpandableCardTheme themeData) {
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

class _ExpandFadeContainer extends StatefulWidget {
  final Animation<double> fadeAnimation;

  final Animation<double> sizeAnimation;
  final Widget content;
  const _ExpandFadeContainer(
      {Key? key,
      required this.fadeAnimation,
      required this.content,
      required this.sizeAnimation})
      : super(key: key);

  @override
  State<_ExpandFadeContainer> createState() => __ExpandFadeContainerState();
}

class _ExpandSizeContainer extends StatefulWidget {
  final Animation<double> animation;
  final Widget content;

  const _ExpandSizeContainer(
      {Key? key, required this.animation, required this.content})
      : super(key: key);

  @override
  State<_ExpandSizeContainer> createState() => _ExpandSizeContainerState();
}

class _ExpandSizeContainerState extends State<_ExpandSizeContainer> {
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: widget.animation,
      axis: Axis.vertical,
      child: Center(child: widget.content),
    );
  }
}
