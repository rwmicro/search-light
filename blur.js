import Gio from 'gi://Gio';
import GLib from 'gi://GLib';

// ImageMagick 7 ships `magick`; older releases only provide `convert`
const IMAGEMAGICK_BINARIES = ['magick', 'convert'];

export const getBlurredBackgroundPath = () =>
  GLib.build_filenamev([
    GLib.get_user_cache_dir(),
    'search-light',
    'bg-blurred.jpg',
  ]);

const run = (argv, cancellable) =>
  new Promise((resolve, reject) => {
    const proc = new Gio.Subprocess({
      argv,
      flags: Gio.SubprocessFlags.STDOUT_SILENCE | Gio.SubprocessFlags.STDERR_SILENCE,
    });
    proc.init(cancellable);
    proc.wait_check_async(cancellable, (p, res) => {
      try {
        resolve(p.wait_check_finish(res));
      } catch (err) {
        reject(err);
      }
    });
  });

// Writes a blurred copy of `pictureUri` to `outputPath`.
// Resolves to true on success, false if ImageMagick is missing or fails.
export const generateBlurredBackground = async (
  pictureUri,
  outputPath,
  cancellable = null,
) => {
  const input = pictureUri ? Gio.File.new_for_uri(pictureUri).get_path() : null;
  if (!input) {
    return false;
  }

  GLib.mkdir_with_parents(GLib.path_get_dirname(outputPath), 0o755);

  for (const binary of IMAGEMAGICK_BINARIES) {
    try {
      await run(
        [
          binary,
          input,
          '-scale',
          '10%',
          '-blur',
          '0x2.5',
          '-resize',
          '200%',
          outputPath,
        ],
        cancellable,
      );
      return true;
    } catch (err) {
      if (err.matches?.(Gio.IOErrorEnum, Gio.IOErrorEnum.CANCELLED)) {
        return false;
      }
      // binary not found or conversion failed: try the next one
    }
  }

  console.warn(
    'Search Light: could not blur the background, is ImageMagick installed?',
  );
  return false;
};
