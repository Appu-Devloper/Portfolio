import 'package:flutter/material.dart';

class ExpandableCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final bool isLeftAligned;
  final ThemeData theme;

  const ExpandableCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.isLeftAligned,
    required this.theme,
    super.key,
  });

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Check if the screen width is less than 600
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          widget.isLeftAligned ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (!widget.isLeftAligned) const Spacer(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.8, // 80% width of screen
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: widget.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              // Regular shadow
              BoxShadow(
                color: widget.theme.colorScheme.shadow.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 4),
              ),
              // Neon shadow effect
              BoxShadow(
                color: widget.theme.colorScheme.primary.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 3,
                offset: const Offset(0, 0), // Center the glow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(widget.icon, color: widget.theme.colorScheme.primary, size: 40),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: widget.theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: widget.theme.colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.subtitle,
                style: widget.theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: widget.theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 15),
              if (isSmallScreen)
                AnimatedCrossFade(
                  firstChild: Text(
                    widget.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: widget.theme.textTheme.bodyMedium?.copyWith(
                      color: widget.theme.colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                  secondChild: Text(
                    widget.description,
                    style: widget.theme.textTheme.bodyMedium?.copyWith(
                      color: widget.theme.colorScheme.onSurface.withOpacity(0.8),
                    ),
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                )
              else
                Text(
                  widget.description,
                  style: widget.theme.textTheme.bodyMedium?.copyWith(
                    color: widget.theme.colorScheme.onSurface.withOpacity(0.8),
                  ),
                ),
              if (isSmallScreen) const SizedBox(height: 15),
              if (isSmallScreen)
                GestureDetector(
                  onTap: () {
                    if(mounted)
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? 'Read Less' : 'Read More',
                    style: widget.theme.textTheme.bodyMedium?.copyWith(
                      color: widget.theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (widget.isLeftAligned) const Spacer(),
      ],
    );
  }
}
