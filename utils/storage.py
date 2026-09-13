from whitenoise.storage import CompressedManifestStaticFilesStorage


class TolerantManifestStaticFilesStorage(CompressedManifestStaticFilesStorage):
    """WhiteNoise storage that skips missing referenced assets instead of crashing."""

    manifest_strict = False

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