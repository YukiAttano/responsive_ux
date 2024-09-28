## 0.3.0

### Changed

* **Breaking:** WindowSizeBuilder is renamed to WindowSizedBox to better match Flutter widget naming
* **Breaking:** Builder (The builder callback of the once called WindowSizeBuilder) is renamed to WindowSizeBuilder to no longer shadow the Flutter Builder widget

## 0.2.1

### Added

* feat: WindowSizeBuilder.override() constructor to allow widgets to rebuild with a directly
  provided configuration
* feat: Breakpoint and BreakpointBuilder for widgets to rebuild defined on local breakpoints

## 0.2.0

### Added

* **Breaking:** BuildContext is now provided by WindowSizeBuilder

### Fixed

* Example imports fixed to correct library name

## 0.1.0

* feat: add WindowSizeNotifier to listen outside of the build method for changes
* feat: add Material / Compose / Cupertino WindowSizes

## 0.0.2

* doc: fix package name in ReadMe

## 0.0.1

* feat: Alpha release for WindowSizeClass-based definition (see ReadMe.md)