import * as gcp from "@pulumi/gcp";
import { constant } from "../../constant";
import { Network } from "@pulumi/gcp/compute";

export const generatePrivateSubnet = (network: Network) => {
  return new gcp.compute.Subnetwork("private-subnet", {
    ipCidrRange: "10.0.1.0/24",
    region: constant.region["asia-northeast1"],
    network: network.id,
    description: constant.description,
  });
};
