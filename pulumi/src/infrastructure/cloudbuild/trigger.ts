import * as gcp from "@pulumi/gcp";
import { Account, IAMMember } from "@pulumi/gcp/serviceaccount";
import { constant } from "../../constant";
import { getRepositoryName } from "../../util";

export const generatePullRequestTrigger = (serviceAccount: Account) => {
  return new gcp.cloudbuild.Trigger("pull-request-trigger", {
    filename: "ci/pull-request.yaml",
    description: constant.description,
    location: "global",
    github: {
      name: constant.repositoryName,
      owner: constant.gitUserName,
      pullRequest: {
        branch: `^${getRepositoryName()}$`,
      },
    },
    serviceAccount: serviceAccount.id,
  });
};
