workflow "Update" {
    on = "push"
    resolves = [ "Pulumi Deploy (Current Stack)" ]
}

action "Pulumi Deploy (Current Stack)" {
    uses = "docker://pulumi/actions@v0.16.0"
    args = [ "up" ]
    env = {
        "PULUMI_CI" = "up"
    }
    secrets = [
        "b61cd94e1e0d1d1378f1d3c0820f3ff0f5065216"
    ]
}

workflow "Preview" {
    on = "pull_request"
    resolves = "Pulumi Preview (Merged Stack)"
}

action "Pulumi Preview (Merged Stack)" {
    uses = "docker://pulumi/actions@v0.16.0"
    args = [ "preview" ]
    env = {
        "PULUMI_CI" = "pr"
    }
    secrets = [
        "b61cd94e1e0d1d1378f1d3c0820f3ff0f5065216"
    ]
}