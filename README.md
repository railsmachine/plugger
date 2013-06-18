# Plugger

Plugger brings Rails plugins back to Rails 4 for all of us who don't have time to turn our lovely plugins into gems.  Some of us even have good reasons now to make things gems!

## Usage

Instead of using <code>script/rails plugin</code>, you now just use <code>plugger</code> for everything:

* <code>plugger install URL</code> - This installs a new plugin in vendor/plugins.
* <code>plugger remove PLUGINNAME</code> - Removes that plugin from vendor/plugins.

## Support

Plugger supports loading Rails 3-style generators, Rake tasks and, of course, regular plugin stuff through init.rb.

## Help

This took me a morning and a bit to throw together and has only really been tested against [Moonshine](https://github.com/railsmachine/moonshine).

If you find bugs, please report them, but better yet - fix them and submit a pull request!