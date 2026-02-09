FROM python:3.12-slim

WORKDIR /workspace

# Copy both repos from build context
COPY test-repo /workspace/test-repo
COPY source-repo /workspace/source-repo

# Install test dependencies
RUN pip install pytest

# Merge: copy solution code into test directory root (where tests can import it)
RUN if [ -d "source-repo/src" ]; then \
      cp source-repo/src/*.py test-repo/ 2>/dev/null || true; \
    fi

WORKDIR /workspace/test-repo

# Add current directory to Python path for imports
ENV PYTHONPATH=/workspace/test-repo:$PYTHONPATH

# Run tests — exit code determines pass/fail
CMD ["pytest", "tests/", "-v"]
