const { expect } = require('chai');

describe('Cowboys Contract Tests', async function () {
    let owner, addr1, addr2;
    let Cowboys, cowboys;
    let price;
    it('Deployment', async function () {
        [owner, addr1, addr2] = await ethers.getSigners();
        Cowboys = await ethers.getContractFactory('Cowboys');

        cowboys = await Cowboys.deploy(owner.address);

        await cowboys.deployed(owner.address);

        expect(await cowboys.totalSupply()).to.equal(0);

        const balance = await cowboys.balanceOf(owner.address);

        expect(balance).to.equal(0);
    });

    it('should deploy the contract', async function () {
        expect(cowboys.address).to.exist;
    });
    it('supports ERC165', async function () {
        expect(await cowboys.supportsInterface('0x01ffc9a7')).to.eq(true);
    });

    it('supports IERC721', async function () {
        expect(await cowboys.supportsInterface('0x80ac58cd')).to.eq(true);
    });

    it('supports ERC721Metadata', async function () {
        expect(await cowboys.supportsInterface('0x5b5e139f')).to.eq(true);
    });

    it('does not support random interface', async function () {
        expect(await cowboys.supportsInterface('0x00000042')).to.eq(false);
    });

    it('Mint cowboy for own address', async function () {
        Cowboys = await ethers.getContractFactory('Cowboys');

        cowboys = await Cowboys.deploy(owner.address);

        await cowboys.deployed(owner.address);

        expect(await cowboys.totalSupply()).to.equal(0);

        await cowboys.balanceOf(owner.address);

        await cowboys.connect(owner).setOpenMint(true);

        // price is in wei
        price = await cowboys.getMintPrice();

        console.log('price', price);


        await cowboys.connect(addr1).mint(1, {
            value: price,
        });
    });

    it('Total supply should increase 1', async function () {
        expect(await cowboys.totalSupply()).to.equal(1);
    });

    it('Mint cowboy for treasury address', async function () {
        const price = await cowboys.getMintPrice();
        await cowboys.connect(addr1).mintForAddress(1, addr2.address, { value: price });
        const tknBal = await cowboys.balanceOf(addr2.address);
        expect(tknBal).to.equal(1);
    });

    it('Total supply should increase 2', async function () {
        expect(await cowboys.totalSupply()).to.equal(2);
    });

    it('Should transfer from owner to other address', async function () {
        let tknBal = await cowboys.balanceOf(addr1.address);
        console.log('tknBal', tknBal);
        const ownerOf0 = await cowboys.ownerOf(0);
        console.log('ownerOf0', ownerOf0);
        console.log('addr1.address', addr1.address);
        await cowboys.connect(addr1).transferFrom(addr1.address, addr2.address, 0);
        tknBal = await cowboys.balanceOf(addr1.address);
        expect(tknBal).to.equal(0);
    });

    it('Should transfer from treasury to other address', async function () {
        await cowboys.connect(addr2).transferFrom(addr2.address, addr1.address, 1);
        const tknBal = await cowboys.balanceOf(addr2.address);
        expect(tknBal).to.equal(1);
    });

    it('Owner should approve other account to transfer NFT', async function () {
        await cowboys.connect(addr1).approve(addr2.address, 1);
        expect(await cowboys.getApproved(1)).to.equal(addr2.address);
    });

    it('Other address should transfer cowboy', async function () {
        await cowboys.connect(addr2).transferFrom(addr1.address, addr2.address, 1);
        const tknBal = await cowboys.balanceOf(addr2.address);
        expect(tknBal).to.equal(2);
    });

    it('Owner should set the contract to be mintable for everybody ', async function () {
        await cowboys.connect(owner).setOpenMint(true);
        let nonWhitelistPrice = await cowboys.getMintPrice();
        await cowboys.connect(addr1)["mint(uint256)"](1, {
            value: nonWhitelistPrice,
        });

        const tknBal = await cowboys.balanceOf(addr1.address);
        expect(tknBal).to.equal(1);
    });

    it('Total supply should increase', async function () {
        expect(await cowboys.totalSupply()).to.equal(3);
    });
});