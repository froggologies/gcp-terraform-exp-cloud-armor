crs_rules = {
  sqli = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9001"
    expression   = "evaluatePreconfiguredExpr('sqli-v33-stable')"
    description  = "Block SQL injection"
  }
  xss = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9002"
    expression   = "evaluatePreconfiguredExpr('xss-v33-stable')"
    description  = "Block Cross-site scripting"
  }
  lfi = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9003"
    expression   = "evaluatePreconfiguredExpr('lfi-v33-stable')"
    description  = "Block Local file inclusion"
  }
  rfi = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9004"
    expression   = "evaluatePreconfiguredExpr('rfi-v33-stable')"
    description  = "Block Remote file inclusion"
  }
  rce = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9005"
    expression   = "evaluatePreconfiguredExpr('rce-v33-stable')"
    description  = "Block Remote code execution"
  }
  methodenforcement = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9006"
    expression   = "evaluatePreconfiguredExpr('methodenforcement-v33-stable')"
    description  = "Block Method enforcement"
  }
  scannerdetection = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9007"
    expression   = "evaluatePreconfiguredExpr('scannerdetection-v33-stable')"
    description  = "Block Scanner detection"
  }
  protocolattack = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9008"
    expression   = "evaluatePreconfiguredExpr('protocolattack-v33-stable')"
    description  = "Block Protocol attack"
  }
  php = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9009"
    expression   = "evaluatePreconfiguredExpr('php-v33-stable')"
    description  = "Block PHP injection attack"
  }
  sessionfixation = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9010"
    expression   = "evaluatePreconfiguredExpr('sessionfixation-v33-stable')"
    description  = "Block Session fixation attack"
  }
  java = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9011"
    expression   = "evaluatePreconfiguredExpr('java-v33-stable')"
    description  = "Block Java attack"
  }
  nodejs = {
    preview_mode = "false"
    action       = "deny(403)"
    priority     = "9012"
    expression   = "evaluatePreconfiguredExpr('nodejs-v33-stable')"
    description  = "Block NodeJS attack"
  }
}
