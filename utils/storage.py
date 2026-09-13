from whitenoise.storage import CompressedManifestStaticFilesStorage


class TolerantManifestStaticFilesStorage(CompressedManifestStaticFilesStorage):
    """WhiteNoise storage that:
    - Skips missing referenced assets (manifest_strict = False)
    - Skips compression only (avoids the FileNotFoundError race on Render)
    - Still builds the manifest so WhiteNoise can serve files at runtime
    """

    manifest_strict = False

    def post_process(self, paths, dry_run=False, **options):
        # Skip WhiteNoise's compression step, but still run Django's
        # manifest generation so WhiteNoise can find files at runtime.
        from django.contrib.staticfiles.storage import ManifestFilesMixin
        yield from ManifestFilesMixin.post_process(
            self, paths, dry_run, **options
        )

    def stored_name(self, name):
        try:
            return super().stored_name(name)
        except Exception:
            return name

    def url(self, name, **kwargs):
        try:
            return super().url(name, **kwargs)
        except Exception:
            return name

    def hashed_name(self, name, content=None, filename=None):
        try:
            return super().hashed_name(name, content, filename)
        except Exception:
            return name