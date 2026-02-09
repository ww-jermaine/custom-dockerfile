FROM python:3.12-slim

WORKDIR /workspace

# Copy both repos from build context
COPY test-repo /workspace/test-repo
COPY source-repo /workspace/source-repo

# Install test dependencies
RUN pip install pytest

# Merge: copy solution code into test directory
RUN if [ -d "source-repo/src" ] && [ "$(ls -A source-repo/src)" ]; then \
      cp -r source-repo/src/* test-repo/; \
    else \
      echo "Warning: source-repo/src not found or empty"; \
    fi

WORKDIR /workspace/test-repo

# Run tests — exit code determines pass/fail
CMD ["pytest", "tests/", "-v"]
