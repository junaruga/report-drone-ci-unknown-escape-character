def pipeline(name, arch):
  return {
    "kind": "pipeline",
    "type": "docker",
    "name": name,
    "platform": {
      "os": "linux",
      "arch": arch,
    },
    "steps": [
      {
        "name": "test",
        "image": "ruby:2.5-stretch",
        "commands": [
          "echo \"This is .drone.yml\"",
          "uname -m",
          "cat /etc/hosts",
          "ruby -e \"hosts = File.read('/etc/hosts').sub(/^::1\\\\s*localhost.*$/, ''); File.write('/etc/hosts', hosts)\"",
          "cat /etc/hosts"
        ]
      }
    ]
  }

def main(ctx):
  return [
    pipeline("arm64", "arm64"),
    pipeline("arm32", "arm")
  ]
