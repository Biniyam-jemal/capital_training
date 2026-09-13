from whitenoise.storage import CompressedManifestStaticFilesStorage


class TolerantManifestStaticFilesStorage(CompressedManifestStaticFilesStorage):
    """WhiteNoise storage that:
    - Skips missing referenced assets (manifest_strict = False)
    - Skips the compression post-processing step entirely
      (which crashes on Render's ephemeral filesystem)
    """
    manifest_strict = False

    def post_process(self, paths, dry_run=False, **options):
        # Skip WhiteNoise's post-processing (hashing + compression) entirely.
        # Files are still collected; they just aren't gzip-compressed.
        # WhiteNoise will still serve them uncompressed at runtime.
        return
        yield  # unreachable, but makes this a generator function

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