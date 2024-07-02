#!/bin/bash
# Copyright Broadcom, Inc. All Rights Reserved.
# SPDX-License-Identifier: APACHE-2.0

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace

# Load libraries
. /opt/bitnami/scripts/libspark.sh
. /opt/bitnami/scripts/libos.sh

# Load Spark environment settings
. /opt/bitnami/scripts/spark-env.sh

if [ "$SPARK_MODE" == "master" ]; then
    # Master constants
    EXEC=$(command -v start-master.sh)
    ARGS=()
    info "** Starting Spark in master mode **"
elif [ "$SPARK_MODE" == "worker" ]; then
    # Worker constants
    EXEC=$(command -v start-worker.sh)
    ARGS=("$SPARK_MASTER_URL")
    info "** Starting Spark in worker mode **"
elif [ "$SPARK_MODE" == "thrift" ]; then
    # Thrift server
    EXEC=$(command -v start-thriftserver.sh)
    ARGS=("$SPARK_MASTER_URL")
    info "** Starting Spark in thrift mode"
else
    info "** Unknown mode $SPARK_MODE (master/worker/thrift)"
    exit 1
fi

if am_i_root; then
    exec_as_user "$SPARK_DAEMON_USER" "$EXEC" "${ARGS[@]-}"
else
    exec "$EXEC" "${ARGS[@]-}"
fi
