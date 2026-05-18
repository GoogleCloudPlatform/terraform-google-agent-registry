# Agent Registry Agent

This module provides a data source to discover and fetch metadata for AI agents registered in the Google Cloud Agent Registry. It provides access to agent characteristics such as version, framework (e.g., ADK), and capabilities (A2A agent card).

## Usage

Use this module to resolve the SPIFFE ID and endpoint details for Agent-to-Agent (A2A) communication.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| agent\_id | The system-generated ID for a registered agent. | `string` | `null` | no |
| filter | A filter string to find the Agent (e.g., 'display\_name="my-agent"'). | `string` | `null` | no |
| location | The location of the Agent Registry resource (e.g., us-central1). | `string` | n/a | yes |
| module\_depends\_on | A list of external resources or modules that this module should depend on. | `list(string)` | `[]` | no |
| project\_id | The ID of the project in which the resource belongs. | `string` | n/a | yes |
| wait\_time | A dynamic wait time to delay agent data fetching, specified as a string (e.g., '10s'). Defaults to '0s'. | `string` | `"0s"` | no |

## Outputs

| Name | Description |
|------|-------------|
| agent\_display\_name | The display name of the Agent. |
| agent\_framework | The OSS agent framework used to develop the agent. |
| agent\_id | The agent id. |
| agent\_protocols | The connection details and interfaces for the Agent. |
| agent\_skills | The list of skills and capabilities defined for the Agent. |
| agent\_urn | The globally unique URN for the agent. |
| agent\_version | The version of the Agent. |
| last\_updated | The last time the agent metadata was updated. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
