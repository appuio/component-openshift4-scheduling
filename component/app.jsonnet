local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.openshift4_scheduling;
local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('openshift4-scheduling', params.namespace);

{
  'openshift4-scheduling': app,
}
