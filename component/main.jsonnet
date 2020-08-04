local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.openshift4_scheduling;

local schedulers =
  if params.schedulers != null
  then std.objectFields(params.schedulers)
  else [];

{
  [name]:
    kube._Object('config.openshift.io/v1', 'Scheduler', name) {
      spec: params.schedulers[name],
    }
  for name in schedulers
} + {
  [if std.length(schedulers) == 0 then '.gitkeep']: {},
}
