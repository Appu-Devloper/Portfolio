import 'package:flutter/material.dart';
import 'package:project_3d/UIScreens/home.dart';
import '../Constants/data.dart';
import 'contactpage.dart';
import 'projects.dart';

class ResponsiveHomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const ResponsiveHomePage({super.key, required this.onToggleTheme});

  @override
  _ResponsiveHomePageState createState() => _ResponsiveHomePageState();
}

class _ResponsiveHomePageState extends State<ResponsiveHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _workSectionKey = GlobalKey();
  final GlobalKey _skillsSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  String selectedSection = 'Work';
  bool _isMenuOpen = false;

  void _scrollToSection(GlobalKey key, String sectionName) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.decelerate,
        alignment: 0.1,
      );
      setState(() {
        selectedSection = sectionName;
        _isMenuOpen = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final isMobile = MediaQuery.of(context).size.width < 600;

    // Close the menu if the screen size changes to desktop
    if (!isMobile && _isMenuOpen) {
      setState(() {
        _isMenuOpen = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;
// Check if theme is null or not loaded

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            // Main scrollable content
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  Section(
                    key: _workSectionKey,
                    content: HomeSection(screenWidth: MediaQuery.sizeOf(context).width,)
                  ),
                  Section(
                      key: _skillsSectionKey,
                      content: ProjectsListView(
                        projects: projects,
                        theme: theme,
                      )),
                  Section(
                    key: _contactSectionKey,
                    content: ContactPage()
                  ),
                ],
              ),
            ),

            // Top navigation bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: theme.colorScheme.background,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.code,
                        color: theme.colorScheme.primary, size: 28),
                    if (!isMobile)
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 50,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.onSecondaryFixed,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildNavItem('Home', _workSectionKey, theme),
                                _buildNavItem(
                                    'Experience', _skillsSectionKey, theme),
                                _buildNavItem(
                                    'Contact', _contactSectionKey, theme),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            theme.brightness == Brightness.dark
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            color: theme.colorScheme.primary,
                          ),
                          onPressed: widget.onToggleTheme,
                        ),
                        if (isMobile)
                          IconButton(
                            icon: Icon(
                              _isMenuOpen ? Icons.close : Icons.menu,
                              color: theme.colorScheme.primary,
                            ),
                            onPressed: () {
                              setState(() {
                                _isMenuOpen = !_isMenuOpen;
                              });
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Full-screen menu overlay
            if (_isMenuOpen)
              Positioned.fill(
                child: Material(
                  color: theme.colorScheme.background
                      .withOpacity(0.9), // Semi-transparent background
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          theme.brightness == Brightness.dark
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: theme.colorScheme.primary,
                        ),
                        onPressed: widget.onToggleTheme,
                      ),
                      const SizedBox(height: 40),
                      _buildFullScreenMenuItem('Home', _workSectionKey, theme),
                      const SizedBox(height: 20),
                      _buildFullScreenMenuItem(
                          'Experience', _skillsSectionKey, theme),
                      const SizedBox(height: 20),
                      _buildFullScreenMenuItem(
                          'Contact', _contactSectionKey, theme),
                      const SizedBox(height: 40),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: theme.colorScheme.primary,
                        ),
                        onPressed: () {
                          setState(() {
                            _isMenuOpen = !_isMenuOpen;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullScreenMenuItem(
      String label, GlobalKey key, ThemeData theme) {
    return InkWell(
      onTap: () => _scrollToSection(key, label.replaceAll(RegExp(r'[<>]'), '')),
      child: Text(
        label,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onBackground,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNavItem(String label, GlobalKey key, ThemeData theme) {
    final isSelected = selectedSection == label;
    return InkWell(
      onTap: () => _scrollToSection(key, label),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final Widget content;

  const Section({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
