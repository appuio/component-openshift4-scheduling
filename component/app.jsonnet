local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.openshift4_scheduling;
local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('openshift4-scheduling', params.namespace, secrets=false);

local appPath =
  local project = std.get(app, 'spec', { project: 'syn' }).project;
  if project == 'syn' then 'apps' else 'apps-%s' % project;

{
  ['%s/openshift4-scheduling' % appPath]: app,
}
