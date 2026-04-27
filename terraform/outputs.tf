output "release_name" {
  value = helm_release.wordpress.name
}

output "namespace" {
  value = helm_release.wordpress.namespace
}