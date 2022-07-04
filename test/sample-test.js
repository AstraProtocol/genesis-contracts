const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Treasury", function () {

  it("test owner", async function () {
    const [owner, addr1] = await ethers.getSigners();

    const Treasury = await ethers.getContractFactory("Treasury");
    const treasury = await Treasury.deploy(addr1.address);
    await treasury.deployed();

    expect(await treasury.owner()).to.equal(addr1.address);

  });
});
