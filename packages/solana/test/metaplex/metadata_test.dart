// ignore_for_file: avoid-duplicate-collection-elements

import 'package:solana/metaplex.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('correctly decodes metadata', () {
    const binary = [
      4, 174, 11, 137, 54, 21, 144, 166, 92, 182, 28, 182, 116, 227, //
      199, 241, 224, 142, 150, 207, 98, 197, 219, 99, 39, 225, 190, 89, 165,
      232, 102, 131, 132, 222, 81, 9, 233, 15, 70, 172, 40, 12, 66, 67, 237,
      145, 72, 88, 172, 46, 10, 240, 227, 11, 245, 255, 56, 32, 168, 178, 148,
      164, 182, 61, 218, 32, 0, 0, 0, 67, 111, 102, 114, 101, 32, 35, 53, 49,
      52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
      0, 0, 0, 67, 79, 70, 82, 0, 0, 0, 0, 0, 0, 200, 0, 0, 0, 104, 116, 116,
      112, 115, 58, 47, 47, 97, 114, 119, 101, 97, 118, 101, 46, 110, 101, 116,
      47, 76, 111, 103, 85, 76, 77, 117, 69, 106, 68, 83, 79, 103, 45, 84, 110,
      115, 98, 111, 73, 70, 54, 85, 118, 109, 90, 121, 121, 114, 54, 106, 51,
      66, 68, 67, 78, 52, 112, 52, 54, 70, 114, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 209, 85, 148, 16, 38, 52, 248, 117, 197, 32,
      236, 63, 23, 114, 210, 240, 141, 12, 70, 169, 38, 105, 143, 154, 34, 208,
      244, 84, 105, 171, 1, 163, 1, 0, 174, 11, 137, 54, 21, 144, 166, 92, 182,
      28, 182, 116, 227, 199, 241, 224, 142, 150, 207, 98, 197, 219, 99, 39,
      225, 190, 89, 165, 232, 102, 131, 132, 0, 100, 1, 1, 1, 254, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0,
    ];
    final metadata = Metadata.fromBinary(binary);
    expect(
      metadata,
      isA<Metadata>()
          .having((m) => m.name, 'name', 'Cofre #514')
          .having((m) => m.symbol, 'symbol', 'COFR')
          .having(
            (m) => m.mint,
            'mintAccount',
            'FxqBSMd2pYwTvAYjUKb4mWUBtV4LWCF4o9yvmtEMxcFB',
          )
          .having(
            (m) => m.updateAuthority,
            'updateAuthority',
            'CiQ9EKdmFo7t8xiMPHuk1YhtfEdyaNANL1X6PsZojVH5',
          )
          .having(
            (m) => m.uri,
            'uri',
            'https://arweave.net/LogULMuEjDSOg-TnsboIF6UvmZyyr6j3BDCN4p46Frc',
          ),
    );
  });

  test('gracefully fetch external JSON', () async {
    // 6GpMXZmS7bBHBc9TrVRFUaerSQXYJPkpq31aET3UWd4R
    const metadataUSDC = Metadata(
      name: 'USC Coin',
      symbol: 'USDC',
      uri: '',
      updateAuthority: '2wmVCSfPxGPjrnMMn7rchp4uaeoTqN39mXFC2zhPdri9',
      mint: 'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
    );
    expect(
      await metadataUSDC.getExternalJson(),
      equals(null),
    );

    // JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN
    const metadataJUP = Metadata(
      name: 'Jupiter',
      symbol: 'JUP',
      uri: 'https://static.jup.ag/jup/metadata.json',
      updateAuthority: '61aq585V8cR2sZBeawJFt2NPqmN7zDi1sws4KLs5xHXV',
      mint: 'JUPyiwrYJFskUPiHa7hkeR8VUtAeFoSYbKedZNsDvCN',
    );
    expect(
      await metadataJUP.getExternalJson(),
      isA<OffChainMetadata>(),
    );

    const metadataMock = Metadata(
      name: 'Mock',
      symbol: 'MOCK',
      uri: 'https://httpbun.com/payload',
      // An empty plain text payload.
      updateAuthority: '',
      mint: '',
    );
    await expectLater(
      () => metadataMock.getExternalJson(),
      throwsA(isA<FormatException>()),
    );
  });
}
