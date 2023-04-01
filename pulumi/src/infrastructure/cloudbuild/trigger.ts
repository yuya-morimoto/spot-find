import * as gcp from "@pulumi/gcp";
import { constant } from "../../constant";
import { generateRandomStringName, getRepositoryName } from "../../util";

export const generatePullRequestTrigger = () => {
  return new gcp.cloudbuild.Trigger(
    generateRandomStringName("pull-request-trigger"),
    {
      filename: "ci/pull-request.yaml",
      description: constant.description,
      location: "global",
      github: {
        name: constant.repositoryName,
        owner: constant.gitUserName,
        push: {
          branch: `^${getRepositoryName()}$`,
        },
      },
      triggerTemplate: {
        branchName: getRepositoryName(),
        repoName: constant.repositoryName,
      },
    }
  );
};
