#!/usr/bin/env bash
set -x

cf api ${CF_API_URI}
cf auth ${CF_USERNAME} ${CF_PASSWORD}

# Create org if it doesn't exist
HAS_ORG=$(cf orgs | grep ${ORG} || true)
if [ -z "$HAS_ORG" ]; then
  cf create-org ${ORG}
fi

cf target -o ${ORG}

# Create space if it doesn't exist
HAS_SPACE=$(cf spaces | grep ${SPACE} || true)
if [ -z "$HAS_SPACE" ]; then
  cf create-space ${SPACE}
fi

cf target -s ${SPACE}

cf push
