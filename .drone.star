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
          "uname -m",
          "echo \"/^::1 .+$/\"",
          "cat /etc/hosts",
          "ruby -e \"hosts = File.read('/etc/hosts').sub(/^::1 .+$/, ''); p hosts; File.write('/etc/hosts', hosts)\"",
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
