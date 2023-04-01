import * as pulumi from "@pulumi/pulumi";
import * as gcp from "@pulumi/gcp";
import { constant } from "./src/constant";

const vpc = new gcp.compute.Network(`${constant.repositoryName}-main-vpc`, {
  description: constant.description,
  autoCreateSubnetworks: false,
});

const privateSubnet = new gcp.compute.Subnetwork(`private-subnet`, {
  ipCidrRange: "10.0.1.0/24",
  region: constant.region["asia-northeast1"],
  network: vpc.id,
  description: constant.description,
});
