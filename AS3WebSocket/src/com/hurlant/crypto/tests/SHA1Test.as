/**
 * SHA1Test
 * 
 * A test class for SHA1
 * Copyright (c) 2007 Henri Torgemane
 * 
 * See LICENSE.txt for full license information.
 */
package com.hurlant.crypto.tests
{
	import com.hurlant.crypto.hash.SHA1;
	import com.hurlant.util.Hex;
	
	import flash.utils.ByteArray;
	
	public class SHA1Test extends TestCase
	{
		public function SHA1Test(h:ITestHarness)
		{
			super(h, "SHA-1 Test");
			runTest(testSha1,"SHA-1 Test Vectors");
			runTest(testLongSha1,"SHA-1 Long Test Vectors");
			h.endTestCase();
		}		
		
		/**
		 * Test Vectors grabbed from
		 * http://csrc.nist.gov/cryptval/shs.htm
		 */
		public function testSha1():void {
			var srcs:Array = [
			"",
			"a8",
			"3000",
			"42749e",
			"9fc3fe08",
			"b5c1c6f1af",
			"e47571e5022e",
			"3e1b28839fb758",
			"a81350cbb224cb90",
			"c243d167923dec3ce1",
			"50ac18c59d6a37a29bf4",
			"98e2b611ad3b1cccf634f6",
			"73fe9afb68e1e8712e5d4eec",
			"9e701ed7d412a9226a2a130e66",
			"6d3ee90413b0a7cbf69e5e6144ca",
			"fae24d56514efcb530fd4802f5e71f",
			"c5a22dd6eda3fe2bdc4ddb3ce6b35fd1",
			"d98cded2adabf08fda356445c781802d95",
			"bcc6d7087a84f00103ccb32e5f5487a751a2",
			"36ecacb1055434190dbbc556c48bafcb0feb0d",
			"5ff9edb69e8f6bbd498eb4537580b7fba7ad31d0",
			"c95b441d8270822a46a798fae5defcf7b26abace36",
			"83104c1d8a55b28f906f1b72cb53f68cbb097b44f860",
			"755175528d55c39c56493d697b790f099a5ce741f7754b",
			"088fc38128bbdb9fd7d65228b3184b3faac6c8715f07272f",
			"a4a586eb9245a6c87e3adf1009ac8a49f46c07e14185016895",
			"8e7c555270c006092c2a3189e2a526b873e2e269f0fb28245256",
			"a5f3bfa6bb0ba3b59f6b9cbdef8a558ec565e8aa3121f405e7f2f0",
			"589054f0d2bd3c2c85b466bfd8ce18e6ec3e0b87d944cd093ba36469",
			"a0abb12083b5bbc78128601bf1cbdbc0fdf4b862b24d899953d8da0ff3",
			"82143f4cea6fadbf998e128a8811dc75301cf1db4f079501ea568da68eeb",
			"9f1231dd6df1ff7bc0b0d4f989d048672683ce35d956d2f57913046267e6f3",
			"041c512b5eed791f80d3282f3a28df263bb1df95e1239a7650e5670fc2187919",
			"17e81f6ae8c2e5579d69dafa6e070e7111461552d314b691e7a3e7a4feb3fae418",
			"d15976b23a1d712ad28fad04d805f572026b54dd64961fda94d5355a0cc98620cf77",
			"09fce4d434f6bd32a44e04b848ff50ec9f642a8a85b37a264dc73f130f22838443328f",
			"f17af27d776ec82a257d8d46d2b46b639462c56984cc1be9c1222eadb8b26594a25c709d",
			"b13ce635d6f8758143ffb114f2f601cb20b6276951416a2f94fbf4ad081779d79f4f195b22",
			"5498793f60916ff1c918dde572cdea76da8629ba4ead6d065de3dfb48de94d234cc1c5002910",
			"498a1e0b39fa49582ae688cd715c86fbaf8a81b8b11b4d1594c49c902d197c8ba8a621fd6e3be5",
			"3a36ae71521f9af628b3e34dcb0d4513f84c78ee49f10416a98857150b8b15cb5c83afb4b570376e",
			"dcc76b40ae0ea3ba253e92ac50fcde791662c5b6c948538cffc2d95e9de99cac34dfca38910db2678f",
			"5b5ec6ec4fd3ad9c4906f65c747fd4233c11a1736b6b228b92e90cddabb0c7c2fcf9716d3fad261dff33",
			"df48a37b29b1d6de4e94717d60cdb4293fcf170bba388bddf7a9035a15d433f20fd697c3e4c8b8c5f590ab",
			"1f179b3b82250a65e1b0aee949e218e2f45c7a8dbfd6ba08de05c55acfc226b48c68d7f7057e5675cd96fcfc",
			"ee3d72da3a44d971578972a8e6780ce64941267e0f7d0179b214fa97855e1790e888e09fbe3a70412176cb3b54",
			"d4d4c7843d312b30f610b3682254c8be96d5f6684503f8fbfbcd15774fc1b084d3741afb8d24aaa8ab9c104f7258",
			"32c094944f5936a190a0877fb9178a7bf60ceae36fd530671c5b38c5dbd5e6a6c0d615c2ac8ad04b213cc589541cf6",
			"e5d3180c14bf27a5409fa12b104a8fd7e9639609bfde6ee82bbf9648be2546d29688a65e2e3f3da47a45ac14343c9c02",
			"e7b6e4b69f724327e41e1188a37f4fe38b1dba19cbf5a7311d6e32f1038e97ab506ee05aebebc1eed09fc0e357109818b9",
			"bc880cb83b8ac68ef2fedc2da95e7677ce2aa18b0e2d8b322701f67af7d5e7a0d96e9e33326ccb7747cfff0852b961bfd475",
			"235ea9c2ba7af25400f2e98a47a291b0bccdaad63faa2475721fda5510cc7dad814bce8dabb611790a6abe56030b798b75c944",
			"07e3e29fed63104b8410f323b975fd9fba53f636af8c4e68a53fb202ca35dd9ee07cb169ec5186292e44c27e5696a967f5e67709",
			"65d2a1dd60a517eb27bfbf530cf6a5458f9d5f4730058bd9814379547f34241822bf67e6335a6d8b5ed06abf8841884c636a25733f",
			"dcc86b3bd461615bab739d8daafac231c0f462e819ad29f9f14058f3ab5b75941d4241ea2f17ebb8a458831b37a9b16dead4a76a9b0e",
			"4627d54f0568dc126b62a8c35fb46a9ac5024400f2995e51635636e1afc4373dbb848eb32df23914230560b82477e9c3572647a7f2bb92",
			"ba531affd4381168ef24d8b275a84d9254c7f5cc55fded53aa8024b2c5c5c8aa7146fe1d1b83d62b70467e9a2e2cb67b3361830adbab28d7",
			"8764dcbcf89dcf4282eb644e3d568bdccb4b13508bfa7bfe0ffc05efd1390be22109969262992d377691eb4f77f3d59ea8466a74abf57b2ef4",
			"497d9df9ddb554f3d17870b1a31986c1be277bc44feff713544217a9f579623d18b5ffae306c25a45521d2759a72c0459b58957255ab592f3be4",
			"72c3c2e065aefa8d9f7a65229e818176eef05da83f835107ba90ec2e95472e73e538f783b416c04654ba8909f26a12db6e5c4e376b7615e4a25819",
			"7cc9894454d0055ab5069a33984e2f712bef7e3124960d33559f5f3b81906bb66fe64da13c153ca7f5cabc89667314c32c01036d12ecaf5f9a78de98",
			"74e8404d5a453c5f4d306f2cfa338ca65501c840ddab3fb82117933483afd6913c56aaf8a0a0a6b2a342fc3d9dc7599f4a850dfa15d06c61966d74ea59",
			"46fe5ed326c8fe376fcc92dc9e2714e2240d3253b105adfbb256ff7a19bc40975c604ad7c0071c4fd78a7cb64786e1bece548fa4833c04065fe593f6fb10",
			"836dfa2524d621cf07c3d2908835de859e549d35030433c796b81272fd8bc0348e8ddbc7705a5ad1fdf2155b6bc48884ac0cd376925f069a37849c089c8645",
			"7e3a4c325cb9c52b88387f93d01ae86d42098f5efa7f9457388b5e74b6d28b2438d42d8b64703324d4aa25ab6aad153ae30cd2b2af4d5e5c00a8a2d0220c6116"];
			var hashes:Array = [
				"da39a3ee5e6b4b0d3255bfef95601890afd80709",
				"99f2aa95e36f95c2acb0eaf23998f030638f3f15",
				"f944dcd635f9801f7ac90a407fbc479964dec024",
				"a444319e9b6cc1e8464c511ec0969c37d6bb2619",
				"16a0ff84fcc156fd5d3ca3a744f20a232d172253",
				"fec9deebfcdedaf66dda525e1be43597a73a1f93",
				"8ce051181f0ed5e9d0c498f6bc4caf448d20deb5",
				"67da53837d89e03bf652ef09c369a3415937cfd3",
				"305e4ff9888ad855a78573cddf4c5640cce7e946",
				"5902b77b3265f023f9bbc396ba1a93fa3509bde7",
				"fcade5f5d156bf6f9af97bdfa9c19bccfb4ff6ab",
				"1d20fbe00533c10e3cbd6b27088a5de0c632c4b5",
				"7e1b7e0f7a8f3455a9c03e9580fd63ae205a2d93",
				"706f0677146307b20bb0e8d6311e329966884d13",
				"a7241a703aaf0d53fe142f86bf2e849251fa8dff",
				"400f53546916d33ad01a5e6df66822dfbdc4e9e6",
				"fac8ab93c1ae6c16f0311872b984f729dc928ccd",
				"fba6d750c18da58f6e2aab10112b9a5ef3301b3b",
				"29d27c2d44c205c8107f0351b05753ac708226b6",
				"b971bfc1ebd6f359e8d74cb7ecfe7f898d0ba845",
				"96d08c430094b9fcc164ad2fb6f72d0a24268f68",
				"a287ea752a593d5209e287881a09c49fa3f0beb1",
				"a06c713779cbd88519ed4a585ac0cb8a5e9d612b",
				"bff7d52c13a3688132a1d407b1ab40f5b5ace298",
				"c7566b91d7b6f56bdfcaa9781a7b6841aacb17e9",
				"ffa30c0b5c550ea4b1e34f8a60ec9295a1e06ac1",
				"29e66ed23e914351e872aa761df6e4f1a07f4b81",
				"b28cf5e5b806a01491d41f69bd9248765c5dc292",
				"60224fb72c46069652cd78bcd08029ef64da62f3",
				"b72c4a86f72608f24c05f3b9088ef92fba431df7",
				"73779ad5d6b71b9b8328ef7220ff12eb167076ac",
				"a09671d4452d7cf50015c914a1e31973d20cc1a0",
				"e88cdcd233d99184a6fd260b8fca1b7f7687aee0",
				"010def22850deb1168d525e8c84c28116cb8a269",
				"aeaa40ba1717ed5439b1e6ea901b294ba500f9ad",
				"c6433791238795e34f080a5f1f1723f065463ca0",
				"e21e22b89c1bb944a32932e6b2a2f20d491982c3",
				"575323a9661f5d28387964d2ba6ab92c17d05a8a",
				"feb44494af72f245bfe68e86c4d7986d57c11db7",
				"cff2290b3648ba2831b98dde436a72f9ebf51eee",
				"9b4efe9d27b965905b0c3dab67b8d7c9ebacd56c",
				"afedb0ff156205bcd831cbdbda43db8b0588c113",
				"8deb1e858f88293a5e5e4d521a34b2a4efa70fc4",
				"95cbdac0f74afa69cebd0e5c7defbc6faf0cbeaf",
				"f0307bcb92842e5ae0cd4f4f14f3df7f877fbef2",
				"7b13bb0dbf14964bd63b133ac85e22100542ef55",
				"c314d2b6cf439be678d2a74e890d96cfac1c02ed",
				"4d0be361e410b47a9d67d8ce0bb6a8e01c53c078",
				"e5353431ffae097f675cbf498869f6fbb6e1c9f2",
				"b8720a7068a085c018ab18961de2765aa6cd9ac4",
				"b0732181568543ba85f2b6da602b4b065d9931aa",
				"9c22674cf3222c3ba921672694aafee4ce67b96b",
				"d128335f4cecca9066cdae08958ce656ff0b4cfc",
				"0b67c57ac578de88a2ae055caeaec8bb9b0085a0",
				"c766f912a89d4ccda88e0cce6a713ef5f178b596",
				"9aa3925a9dcb177b15ccff9b78e70cf344858779",
				"4811fa30042fc076acf37c8e2274d025307e5943",
				"6743018450c9730761ee2b130df9b91c1e118150",
				"71ad4a19d37d92a5e6ef3694ddbeb5aa61ada645",
				"a7d9dc68dacefb7d6116186048cb355cc548e11d",
				"142e429f0522ba5abf5131fa81df82d355b96909",
				"ef72db70dcbcab991e9637976c6faf00d22caae9",
				"f220a7457f4588d639dc21407c942e9843f8e26b",
				"ddd2117b6e309c233ede85f962a0c2fc215e5c69",
				"a3054427cdb13f164a610b348702724c808a0dcc"];
			// ok. let's loop.
			var sha1:SHA1 = new SHA1;
			for (var i:uint=0;i<srcs.length;i++) {
				var src:ByteArray = Hex.toArray(srcs[i]);
				var digest:ByteArray = sha1.hash(src);
				assert("SHA1 Test "+i, Hex.fromArray(digest) == hashes[i]);
			}
			
		}
		/**
		 * A few long SHA-1, from the same page
		 */
		public function testLongSha1():void {
			var srcs:Array = [
			"ec29561244ede706b6eb30a1c371d74450a105c3f9735f7fa9fe38cf67f304a5736a106e92e17139a6813b1c81a4f3d3fb9546ab4296fa9f722826c066869edacd73b2548035185813e22634a9da44000d95a281ff9f264ecce0a931222162d021cca28db5f3c2aa24945ab1e31cb413ae29810fd794cad5dfaf29ec43cb38d198fe4ae1da2359780221405bd6712a5305da4b1b737fce7cd21c0eb7728d08235a9011",
			"5fc2c3f6a7e79dc94be526e5166a238899d54927ce470018fbfd668fd9dd97cbf64e2c91584d01da63be3cc9fdff8adfefc3ac728e1e335b9cdc87f069172e323d094b47fa1e652afe4d6aa147a9f46fda33cacb65f3aa12234746b9007a8c85fe982afed7815221e43dba553d8fe8a022cdac1b99eeeea359e5a9d2e72e382dffa6d19f359f4f27dc3434cd27daeeda8e38594873398678065fbb23665aba9309d946135da0e4a4afdadff14db18e85e71dd93c3bf9faf7f25c8194c4269b1ee3d9934097ab990025d9c3aaf63d5109f52335dd3959d38ae485050e4bbb6235574fc0102be8f7a306d6e8de6ba6becf80f37415b57f9898a5824e77414197422be3d36a6080",
			"0f865f46a8f3aed2da18482aa09a8f390dc9da07d51d1bd10fe0bf5f3928d5927d08733d32075535a6d1c8ac1b2dc6ba0f2f633dc1af68e3f0fa3d85e6c60cb7b56c239dc1519a007ea536a07b518ecca02a6c31b46b76f021620ef3fc6976804018380e5ab9c558ebfc5cb1c9ed2d974722bf8ab6398f1f2b82fa5083f85c16a5767a3a07271d67743f00850ce8ec428c7f22f1cf01f99895c0c844845b06a06cecb0c6cf83eb55a1d4ebc44c2c13f6f7aa5e0e08abfd84e7864279057abc471ee4a45dbbb5774afa24e51791a0eada11093b88681fe30baa3b2e94113dc63342c51ca5d1a6096d0897b626e42cb91761058008f746f35465465540ad8c6b8b60f7e1461b3ce9e6529625984cb8c7d46f07f735be067588a0117f23e34ff57800e2bbe9a1605fde6087fb15d22c5d3ac47566b8c448b0cee40373e5ba6eaa21abee71366afbb27dbbd300477d70c371e7b8963812f5ed4fb784fb2f3bd1d3afe883cdd47ef32beaea",
			"4893f1c763625f2c6ce53aacf28026f14b3cd8687e1a1d3b60a81e80fcd1e2b038f9145ab64a0718f948f7c3c9ac92e3d86fb669a5257da1a18c776291653688338210a3242120f101788e8acc9110db9258b1554bf3d26602516ea93606a25a7f566c0c758fb39ecd9d876bc5d8abc1c3205095382c2474cb1f8bbdb45c2c0e659cb0fc703ec607a5de6bcc7a28687db1ee1c8f34797bb2441d5706d210df8c2d7d65dbded36414d063c117b52a51f7a4eb9cac0782e008b47459ed5acac0bc1f20121087f992ad985511b33c866d18e63f585478ee5a5e654b19d81231d98683ae3f0533565aba43dce408d7e3c4c6be11d8f05165f29c9dcb2030c4ee31d3a04e7421aa92c3231a1fc07e50e95fea7389a5e65891afaba51cf55e36a9d089bf293accb356d5d06547307d6e41456d4ed146a056179971c56521c83109bf922866186e184a99a96c7bb96df8937e35970e438412a2b8d744cf2ad87cb605d4232e976f9f15169776e4e5b6b786132c966b25fc56d815c56c819af5e159aa39f8a93d38115f5580cda93bc073c30b39920e726fe861b72483a3f886269ab7a8eefe952f35d25c4eb7f443f4f3f26e43d51fb54591e6a6dad25fcdf5142033084e5624bdd51435e77dea86b8",
			"cf494c18a4e17bf03910631471bca5ba7edea8b9a63381e3463517961749848eb03abefd4ce676dece3740860255f57c261a558aa9c7f11432f549a9e4ce31d8e17c79450ce2ccfc148ad904aedfb138219d7052088520495355dadd90f72e6f69f9c6176d3d45f113f275b7fbc2a295784d41384cd7d629b23d1459a22e45fd5097ec9bf65fa965d3555ec77367903c32141065fc24da5c56963d46a2da3c279e4035fb2fb1c0025d9dda5b9e3443d457d92401a0d3f58b48469ecb1862dc975cdbe75ca099526db8b0329b03928206f084c633c04eef5e8e377f118d30edf592504be9d2802651ec78aeb02aea167a03fc3e23e5fc907c324f283f89ab37e84687a9c74ccf055402db95c29ba2c8d79b2bd4fa96459f8e3b78e07e923b81198267492196ecb71e01c331f8df245ec5bdf8d0e05c91e63bb299f0f6324895304dda721d39410458f117c87b7dd6a0ee734b79fcbe482b2c9e9aa0cef03a39d4b0c86de3bc34b4aadabfa373fd2258f7c40c187744d237080762382f547a36adb117839ca72f8ebbc5a20a07e86f4c8bb923f5787698d278f6db0040e76e54645bb0f97083995b34b9aa445fc424455058795828dd00c32471ec402a307f5aa1b37b1a86d6dae3bcbfbe9ba41cab0beeabf489af0073d4b3837d3f14b815120bc3602d072b5aeefcdec655fe756b660eba7dcf34675acbce317746270599424b9248791a0780449c1eabbb9459cc1e588bfd74df9b1b711c85c09d8aa171b309281947e8f4b6ac438753158f4f36fa"];
			var hashes:Array = [
			"970111c4e77bcc88cc20459c02b69b4aa8f58217",
			"0423dc76a8791107d14e13f5265b343f24cc0f19",
			"6692a71d73e00f27df976bc56df4970650d90e45",
			"dc5859dd5163c4354d5d577b855fa98e37f04384",
			"4c17926feb6e87f5bca7890d8a5cde744f231dab"];
			// ok. let's loop.
			var sha1:SHA1 = new SHA1;
			for (var i:uint=0;i<srcs.length;i++) {
				var src:ByteArray = Hex.toArray(srcs[i]);
				var digest:ByteArray = sha1.hash(src);
				assert("SHA1 Long Test "+i, Hex.fromArray(digest) == hashes[i]);
			}
			
		}
	}
}