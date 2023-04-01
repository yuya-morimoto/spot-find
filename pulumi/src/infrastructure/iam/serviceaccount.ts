import * as gcp from "@pulumi/gcp";
import * as pulumi from "@pulumi/pulumi";
import { constant } from "../../constant";

const projectId = gcp.config.project || "";

export const generateCloudBuildServiceAccount = () => {
  const serviceAccount = new gcp.serviceaccount.Account(
    "cloud-build-service-account",
    {
      accountId: "cloud-build-service-account",
      description: constant.description,
    }
  );

  const cloudBuildServiceAccount = new gcp.projects.IAMMember(
    "cloud-build-service-account",
    {
      project: projectId,
      role: "roles/cloudbuild.builds.builder",
      member: pulumi.interpolate`serviceAccount:${serviceAccount.email}`,
    }
  );

  const computeAdmin = new gcp.projects.IAMMember("compute-admin", {
    project: projectId,
    role: "roles/compute.admin",
    member: pulumi.interpolate`serviceAccount:${serviceAccount.email}`,
  });

  const secretAccessor = new gcp.projects.IAMMember("secret-accessor", {
    project: projectId,
    role: "roles/secretmanager.secretAccessor",
    member: pulumi.interpolate`serviceAccount:${serviceAccount.email}`,
  });

  const storageAdmin = new gcp.projects.IAMMember("storage-admin", {
    project: projectId,
    role: "roles/storage.objectAdmin",
    member: pulumi.interpolate`serviceAccount:${serviceAccount.email}`,
  });

  return {
    serviceAccount: serviceAccount,
    role: {
      cloudBuildServiceAccount,
      computeAdmin,
      secretAccessor,
      storageAdmin,
    },
  };
};
