import * as gcp from "@pulumi/gcp";

const activateTarget = [
  {
    name: "cloud-functions-api",
    service: "cloudfunctions.googleapis.com",
  },
  {
    name: "logging-api",
    service: "logging.googleapis.com",
  },
  {
    name: "compute-api",
    service: "compute.googleapis.com",
  },
  {
    name: "pubsub-api",
    service: "pubsub.googleapis.com",
  },
  {
    name: "run-api",
    service: "run.googleapis.com",
  },
  {
    name: "secret-manager-api",
    service: "secretmanager.googleapis.com",
  },
  {
    name: "iam-api",
    service: "iam.googleapis.com",
  },
  {
    name: "cloud-build-api",
    service: "cloudbuild.googleapis.com",
  },
  {
    name: "artifactregistry-api",
    service: "artifactregistry.googleapis.com",
  },
];

export const activateApiFlow = () => {
  return activateTarget.map(({ name, service }) => {
    return new gcp.projects.Service(name, {
      service,
    });
  });
};
