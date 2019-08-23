//
//  SCSiriWaveformView.h
//  MockupMC3
//
//  Created by Arief Shaifullah Akbar on 23/08/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

@import UIKit;

IB_DESIGNABLE
@interface SCSiriWaveformView : UIView

/*
 * suruh gelombang gambar sendiri dengan level yang diberikan (normalized value)
 */
- (void)updateWithLevel:(CGFloat)level;

/*
 * Total banyaknya gelombang
 * Default: 5
 */
@property (nonatomic, assign) NSUInteger numberOfWaves;

/*
 * Warna yang dipakai gelombang (tema appsnya ijo mungkin di ijoin)
 * Default: white
 */
@property (nonatomic, strong) IBInspectable UIColor *waveColor;

/*
 * tebal garis gelombang utama
 * Default: 3.0f
 */
@property (nonatomic, assign)  IBInspectable CGFloat primaryWaveLineWidth;

/*
 * tebal gelombang bayangan
 * Default: 1.0f
 */
@property (nonatomic, assign) IBInspectable CGFloat secondaryWaveLineWidth;

/*
 * amplitudo yang dipakai saat amplitudo yang akan masuk mendekati nol
 * Setting nilai lebih besar daripada 0 menghasilkan visualisasi yang vivid
 * Default: 0.01
 */
@property (nonatomic, assign) IBInspectable CGFloat idleAmplitude;

/*
 * The frequency of the sinus wave. makin tinggi nilainya, makin tinggi gelombangnya.
 * Default: 1.5
 */
@property (nonatomic, assign) IBInspectable CGFloat frequency;

/*
 * The current amplitude
 */
@property (nonatomic, assign, readonly) IBInspectable CGFloat amplitude;

/*
 * The lines are joined stepwise, makin rapet gambarnya, makin makan cpu.
 * Default: 5
 */
@property (nonatomic, assign) IBInspectable CGFloat density;

/*
 * The phase shift that will be applied with each level setting
 * Ubah ini untuk mengubah kecepatan dan arah animasi
 * Default: -0.15
 */
@property (nonatomic, assign) IBInspectable CGFloat phaseShift;

@end
