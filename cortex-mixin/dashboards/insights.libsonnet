local utils = import 'mixin-utils/utils.libsonnet';

(import 'dashboard-utils.libsonnet') {

  'cortex-insights.json':
    $.dashboard('Cortex / Insights')
    .addClusterSelectorTemplates()
    .addRow(
      $.row('Client health')
      .addPanel(
        $.panel('Last timestamp received') +
        $.queryPanel('cortex_distributor_latest_seen_sample_timestamp_seconds{%s}' % $.jobMatcher($._config.job_names.distributor), '{{cluster}} / {{namespace}} / {{instance}}'),
      )
    ),
}
