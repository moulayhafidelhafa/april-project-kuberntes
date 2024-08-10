resource "helm_release" "argo" {
  namespace  = "default"
  name       = "my-argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  wait       = false
  values = [<<EOF
server:
  ## Server service configuration
  service:
    # -- Server service annotations
    annotations: {}
    # -- Server service labels
    labels: {}
    # -- Server service type
    type: LoadBalancer
    # -- Server service http port for NodePort service type (only if `server.service.type` is set to "NodePort")
    nodePortHttp: 30080
    # -- Server service https port for NodePort service type (only if `server.service.type` is set to "NodePort")
    nodePortHttps: 30443
    # -- Server service http port
    servicePortHttp: 80
    # -- Server service https port
    servicePortHttps: 443
    # -- Server service http port name, can be used to route traffic via istio
    servicePortHttpName: http
    # -- Server service https port name, can be used to route traffic via istio
    servicePortHttpsName: https
    # -- Server service https port appProtocol
    ## Ref: https://kubernetes.io/docs/concepts/services-networking/service/#application-protocol
    servicePortHttpsAppProtocol: ""
    # -- The class of the load balancer implementation
    loadBalancerClass: ""
    # -- LoadBalancer will get created with the IP specified in this field
    loadBalancerIP: ""
    # -- Source IP ranges to allow access to service from
    ## Ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service
    loadBalancerSourceRanges: []
    # -- Server service external IPs
    externalIPs: []
    # -- Denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints
    ## Ref: https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip
    externalTrafficPolicy: Cluster
    # -- Used to maintain session affinity. Supports `ClientIP` and `None`
    ## Ref: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    sessionAffinity: None
  EOF
  ]
}