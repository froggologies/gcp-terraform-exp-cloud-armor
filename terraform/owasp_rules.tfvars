owasp_rules = {
  lfi-stable = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9000"
    expression   = "evaluatePreconfiguredExpr('lfi-stable')"
    description  = "block local file inclusion"
  }
  rce-stable = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9001"
    expression   = "evaluatePreconfiguredExpr('rce-stable')"
    description  = "block rce attacks"
  }
  scannerdetection-stable = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9002"
    expression   = "evaluatePreconfiguredExpr('scannerdetection-stable')"
    description  = "block scanners"
  }
  protocolattack-stable = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9003"
    expression   = "evaluatePreconfiguredExpr('protocolattack-stable')"
    description  = "block protocol attacks"
  }
  sessionfixation-stable = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9004"
    expression   = "evaluatePreconfiguredExpr('sessionfixation-stable')"
    description  = "block session fixation attacks"
  }
}
