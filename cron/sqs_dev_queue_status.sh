#!/usr/bin/env bash

source /opt/mozdef/envs/mozdef/bin/activate
/opt/mozdef/envs/mozdef/cron/sqs_queue_status.py -c /opt/mozdef/envs/mozdef/cron/sqs_dev_queue_status.conf
