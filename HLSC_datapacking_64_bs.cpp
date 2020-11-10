// HASH:3774109067
#include <ap_int.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include <hls_math.h>
#include <math.h>
#include <stdint.h>
#include "kernel.h"
void test(bit32 hcl_rdv3[26][9984], bit32 hcl_trainLabels[6238], ap_uint<64> hcl_in_train[6238][156], ap_uint<64> hcl_in_test[1559][156], bit32 hcl_testLabels[1559], bit32 hcl_epoch) {
    bit32 _top;
    ap_uint<64> pack_rdv3[26][4992];
    pack_rdv3_indices: for (bit32 indices = 0; indices < 26; ++indices) {
      pack_rdv3_temp: for (bit32 temp = 0; temp < 4992; ++temp) {
        ap_uint<64> pack_rdv3_temp;
        pack_rdv3_temp_x: for (bit32 x = 0; x < 1; ++x) {
          pack_rdv3_temp = (ap_uint<64>)0;
        }
        i: for (bit32 i = 0; i < 2; ++i) {
          pack_rdv3_temp(((i * 32) + 31), (i * 32)) = hcl_rdv3[indices][((temp * 2) + i)];
        }
        pack_rdv3[indices][temp] = pack_rdv3_temp;
      }
    }
    ap_uint<64> prototype[26][156];
    prototype_x1: for (bit32 x1 = 0; x1 < 26; ++x1) {
      prototype_y: for (bit32 y = 0; y < 156; ++y) {
        prototype[x1][y] = (ap_uint<64>)0;
      }
    }
    bit32 prototypeCounter[26][9984];
    prototypeCounter_x2: for (bit32 x2 = 0; x2 < 26; ++x2) {
      prototypeCounter_y1: for (bit32 y1 = 0; y1 < 9984; ++y1) {
        prototypeCounter[x2][y1] = 0;
      }
    }
    bit32 compute0[26];
    compute0_x3: for (bit32 x3 = 0; x3 < 26; ++x3) {
      compute0[x3] = 0;
    }
    bit32 learn;
    learn_k: for (bit32 k = 0; k < 26; ++k) {
      ap_uint<64> match[6238][156];
      match_x4: for (bit32 x4 = 0; x4 < 6238; ++x4) {
        match_y2: for (bit32 y2 = 0; y2 < 156; ++y2) {
          if ((hcl_trainLabels[x4] == k)) { 
            match[x4][y2] = hcl_in_train[x4][y2];
          } else { 
            match[x4][y2] = (ap_uint<64>)0;
          }
        }
      }
      i1: for (bit32 i1 = 0; i1 < 6238; ++i1) {
        if (hcl_trainLabels[i1] == k) {
          compute0[k] = (compute0[k] + 1);
        }
      }
      i2: for (bit32 i2 = 0; i2 < 64; ++i2) {
        bit32 result[156];
        result_y3: for (bit32 y3 = 0; y3 < 156; ++y3) {
          bit32 sum;
          sum_x5: for (bit32 x5 = 0; x5 < 1; ++x5) {
            sum = 0;
          }
          result_r: for (bit32 r = 0; r < 6238; ++r) {
            sum = ((bit32)(((ap_int<66>)match[r][y3][i2]) + ((ap_int<66>)sum)));
          }
          result[y3] = sum;
        }
        ap_uint<1> sum1[156];
        sum1_x6: for (bit32 x6 = 0; x6 < 156; ++x6) {
          sum1[x6] = (ap_uint<1>)0;
        }
        if ((compute0[k] % 2) == 0) {
          bit32 update0;
          update0_x7: for (bit32 x7 = 0; x7 < 156; ++x7) {
            sum1[x7] = ((ap_uint<1>)(((ap_int<67>)0 < (((ap_int<67>)(((ap_int<66>)result[x7]) + ((ap_int<66>)pack_rdv3[k][x7][i2]))) - ((ap_int<67>)(compute0[k] / 2)))) ? ((bit32)1) : ((bit32)0)));
          }
        } else {
          bit32 update1;
          update1_x8: for (bit32 x8 = 0; x8 < 156; ++x8) {
            sum1[x8] = ((ap_uint<1>)(((ap_int<33>)0 < (((ap_int<33>)result[x8]) - ((ap_int<33>)(compute0[k] / 2)))) ? ((bit32)1) : ((bit32)0)));
          }
        }
        i3: for (bit32 i3 = 0; i3 < 156; ++i3) {
          prototype[k][i3][i2] = sum1[i3];
          prototypeCounter[(((((ap_int<33>)(i3 * 64)) + ((ap_int<33>)i2)) + ((ap_int<33>)(k * 9984))) / (ap_int<33>)9984)][(((((ap_int<33>)(i3 * 64)) + ((ap_int<33>)i2)) + ((ap_int<33>)(k * 9984))) % (ap_int<33>)9984)] = result[i3];
        }
      }
    }
    bit32 test_train_accu;
    test_train_accu_x9: for (bit32 x9 = 0; x9 < 1; ++x9) {
      ap_uint<64> distance1[156];
      distance1_x10: for (bit32 x10 = 0; x10 < 156; ++x10) {
        distance1[x10] = (ap_uint<64>)0;
      }
      bit32 pre_hamming[156];
      pre_hamming_x11: for (bit32 x11 = 0; x11 < 156; ++x11) {
        pre_hamming[x11] = 0;
      }
      bit32 hamming_dist1[26];
      hamming_dist1_x12: for (bit32 x12 = 0; x12 < 26; ++x12) {
        hamming_dist1[x12] = 0;
      }
      bit32 correct1;
      correct1_x13: for (bit32 x13 = 0; x13 < 1; ++x13) {
        correct1 = 0;
      }
      i4: for (bit32 i4 = 0; i4 < 6238; ++i4) {
        i5: for (bit32 i5 = 0; i5 < 26; ++i5) {
          bit32 update2;
          update2_x14: for (bit32 x14 = 0; x14 < 156; ++x14) {
            distance1[x14] = (hcl_in_train[i4][x14] ^ prototype[i5][x14]);
          }
          bit32 update3;
          update3_x15: for (bit32 x15 = 0; x15 < 156; ++x15) {
            bit32 count;
            count_x16: for (bit32 x16 = 0; x16 < 1; ++x16) {
              count = 0;
            }
            ap_uint<64> numb;
            numb_x17: for (bit32 x17 = 0; x17 < 1; ++x17) {
              numb = distance1[x15];
            }
            while (((ap_uint<64>)0 < numb)) {
              count = (count + 1);
              numb = (numb & (numb - (ap_uint<64>)1));
            }
            pre_hamming[x15] = count;
          }
          bit32 sum_;
          sum_x18: for (bit32 x18 = 0; x18 < 1; ++x18) {
            sum_ = 0;
          }
          test_train_accu_m1: for (bit32 m1 = 0; m1 < 156; ++m1) {
            sum_ = ((bit32)(((ap_int<33>)pre_hamming[m1]) + ((ap_int<33>)sum_)));
          }
          hamming_dist1[i5] = sum_;
        }
        bit32 pred1;
        pred1_x19: for (bit32 x19 = 0; x19 < 1; ++x19) {
          pred1 = 0;
        }
        i6: for (bit32 i6 = 0; i6 < 26; ++i6) {
          if (hamming_dist1[i6] < hamming_dist1[pred1]) {
            pred1 = i6;
          }
        }
        if (pred1 == hcl_trainLabels[i4]) {
          correct1 = (correct1 + 1);
        }
      }
      float all1;
      all1_x20: for (bit32 x20 = 0; x20 < 1; ++x20) {
        all1 = 6.238000e+03f;
      }
      float accuracy1;
      accuracy1_x21: for (bit32 x21 = 0; x21 < 1; ++x21) {
        accuracy1 = ((((float)correct1) / all1) * 1.000000e+02f);
      }
    }
    bit32 test_test_accu;
    test_test_accu_x22: for (bit32 x22 = 0; x22 < 1; ++x22) {
      ap_uint<64> distance1_[156];
      distance1_x23: for (bit32 x23 = 0; x23 < 156; ++x23) {
        distance1_[x23] = (ap_uint<64>)0;
      }
      bit32 pre_hamming_[156];
      pre_hamming_x24: for (bit32 x24 = 0; x24 < 156; ++x24) {
        pre_hamming_[x24] = 0;
      }
      bit32 hamming_dist1_[26];
      hamming_dist1_x25: for (bit32 x25 = 0; x25 < 26; ++x25) {
        hamming_dist1_[x25] = 0;
      }
      bit32 correct1_;
      correct1_x26: for (bit32 x26 = 0; x26 < 1; ++x26) {
        correct1_ = 0;
      }
      i7: for (bit32 i7 = 0; i7 < 1559; ++i7) {
        i8: for (bit32 i8 = 0; i8 < 26; ++i8) {
          bit32 update4;
          update4_x27: for (bit32 x27 = 0; x27 < 156; ++x27) {
            distance1_[x27] = (hcl_in_test[i7][x27] ^ prototype[i8][x27]);
          }
          bit32 update5;
          update5_x28: for (bit32 x28 = 0; x28 < 156; ++x28) {
            bit32 count_;
            count_x29: for (bit32 x29 = 0; x29 < 1; ++x29) {
              count_ = 0;
            }
            ap_uint<64> numb_;
            numb_x30: for (bit32 x30 = 0; x30 < 1; ++x30) {
              numb_ = distance1_[x28];
            }
            while (((ap_uint<64>)0 < numb_)) {
              count_ = (count_ + 1);
              numb_ = (numb_ & (numb_ - (ap_uint<64>)1));
            }
            pre_hamming_[x28] = count_;
          }
          bit32 sum__;
          sum_x31: for (bit32 x31 = 0; x31 < 1; ++x31) {
            sum__ = 0;
          }
          test_test_accu_m11: for (bit32 m11 = 0; m11 < 156; ++m11) {
            sum__ = ((bit32)(((ap_int<33>)pre_hamming_[m11]) + ((ap_int<33>)sum__)));
          }
          hamming_dist1_[i8] = sum__;
        }
        bit32 pred1_;
        pred1_x32: for (bit32 x32 = 0; x32 < 1; ++x32) {
          pred1_ = 0;
        }
        i9: for (bit32 i9 = 0; i9 < 26; ++i9) {
          if (hamming_dist1_[i9] < hamming_dist1_[pred1_]) {
            pred1_ = i9;
          }
        }
        if (pred1_ == hcl_testLabels[i7]) {
          correct1_ = (correct1_ + 1);
        }
      }
      float all1_;
      all1_x33: for (bit32 x33 = 0; x33 < 1; ++x33) {
        all1_ = 1.559000e+03f;
      }
      float accuracy1_;
      accuracy1_x34: for (bit32 x34 = 0; x34 < 1; ++x34) {
        accuracy1_ = ((((float)correct1_) / all1_) * 1.000000e+02f);
      }
    }
    bit32 update;
    update_x35: for (bit32 x35 = 0; x35 < hcl_epoch[0]; ++x35) {
      ap_uint<64> distance[156];
      distance_x36: for (bit32 x36 = 0; x36 < 156; ++x36) {
        distance[x36] = (ap_uint<64>)0;
      }
      bit32 pre_dist[156];
      pre_dist_x37: for (bit32 x37 = 0; x37 < 156; ++x37) {
        pre_dist[x37] = 0;
      }
      bit32 hamming_dist[26];
      hamming_dist_x38: for (bit32 x38 = 0; x38 < 26; ++x38) {
        hamming_dist[x38] = 0;
      }
      i10: for (bit32 i10 = 0; i10 < 6238; ++i10) {
        i11: for (bit32 i11 = 0; i11 < 26; ++i11) {
          bit32 update6;
          update6_x39: for (bit32 x39 = 0; x39 < 156; ++x39) {
            distance[x39] = (hcl_in_train[i10][x39] ^ prototype[i11][x39]);
          }
          bit32 update7;
          update7_x40: for (bit32 x40 = 0; x40 < 156; ++x40) {
            bit32 count__;
            count_x41: for (bit32 x41 = 0; x41 < 1; ++x41) {
              count__ = 0;
            }
            ap_uint<64> numb__;
            numb_x42: for (bit32 x42 = 0; x42 < 1; ++x42) {
              numb__ = distance[x40];
            }
            while (((ap_uint<64>)0 < numb__)) {
              count__ = (count__ + 1);
              numb__ = (numb__ & (numb__ - (ap_uint<64>)1));
            }
            pre_dist[x40] = count__;
          }
          bit32 sum___;
          sum_x43: for (bit32 x43 = 0; x43 < 1; ++x43) {
            sum___ = 0;
          }
          update_m: for (bit32 m = 0; m < 156; ++m) {
            sum___ = ((bit32)(((ap_int<33>)pre_dist[m]) + ((ap_int<33>)sum___)));
          }
          hamming_dist[i11] = sum___;
        }
        bit32 pred;
        pred_x44: for (bit32 x44 = 0; x44 < 1; ++x44) {
          pred = 0;
        }
        i12: for (bit32 i12 = 0; i12 < 26; ++i12) {
          if (hamming_dist[i12] < hamming_dist[pred]) {
            pred = i12;
          }
        }
        if (pred != hcl_trainLabels[i10]) {
          compute0[hcl_trainLabels[i10]] = (compute0[hcl_trainLabels[i10]] + 1);
          compute0[pred] = (compute0[pred] + -1);
          i13: for (bit32 i13 = 0; i13 < 156; ++i13) {
            i14: for (bit32 i14 = 0; i14 < 64; ++i14) {
              prototypeCounter[(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(hcl_trainLabels[i10] * 9984))) / (ap_int<33>)9984)][(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(hcl_trainLabels[i10] * 9984))) % (ap_int<33>)9984)] = ((bit32)(((ap_int<66>)prototypeCounter[(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(hcl_trainLabels[i10] * 9984))) / (ap_int<33>)9984)][(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(hcl_trainLabels[i10] * 9984))) % (ap_int<33>)9984)]) + ((ap_int<66>)hcl_in_train[i10][i13][i14])));
              prototypeCounter[(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(pred * 9984))) / (ap_int<33>)9984)][(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(pred * 9984))) % (ap_int<33>)9984)] = ((bit32)(((ap_int<66>)prototypeCounter[(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(pred * 9984))) / (ap_int<33>)9984)][(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(pred * 9984))) % (ap_int<33>)9984)]) - ((ap_int<66>)hcl_in_train[i10][i13][i14])));
              if ((compute0[hcl_trainLabels[i10]] % 2) == 0) {
                if (((ap_int<33>)prototypeCounter[(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(hcl_trainLabels[i10] * 9984))) / (ap_int<33>)9984)][(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(hcl_trainLabels[i10] * 9984))) % (ap_int<33>)9984)]) == ((ap_int<33>)(compute0[hcl_trainLabels[i10]] / 2))) {
                  prototype[hcl_trainLabels[i10]][i13][i14] = (prototype[hcl_trainLabels[i10]][i13][i14] % (ap_uint<64>)2);
                }
              } else {
                prototype[hcl_trainLabels[i10]][i13][i14] = (((ap_int<33>)0 < (((ap_int<33>)prototypeCounter[(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(hcl_trainLabels[i10] * 9984))) / (ap_int<33>)9984)][(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(hcl_trainLabels[i10] * 9984))) % (ap_int<33>)9984)]) - ((ap_int<33>)(compute0[hcl_trainLabels[i10]] / 2)))) ? ((bit32)1) : ((bit32)0));
              }
              if ((compute0[pred] % 2) == 0) {
                if (((ap_int<33>)prototypeCounter[(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(pred * 9984))) / (ap_int<33>)9984)][(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(pred * 9984))) % (ap_int<33>)9984)]) == ((ap_int<33>)(compute0[pred] / 2))) {
                  prototype[pred][i13][i14] = (prototype[pred][i13][i14] % (ap_uint<64>)2);
                }
              } else {
                prototype[pred][i13][i14] = (((ap_int<33>)0 < (((ap_int<33>)prototypeCounter[(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(pred * 9984))) / (ap_int<33>)9984)][(((((ap_int<33>)(i13 * 64)) + ((ap_int<33>)i14)) + ((ap_int<33>)(pred * 9984))) % (ap_int<33>)9984)]) - ((ap_int<33>)(compute0[pred] / 2)))) ? ((bit32)1) : ((bit32)0));
              }
            }
          }
        }
      }
      bit32 training_update;
      training_update_x45: for (bit32 x45 = 0; x45 < 1; ++x45) {
        ap_uint<64> distance1__[156];
        distance1_x46: for (bit32 x46 = 0; x46 < 156; ++x46) {
          distance1__[x46] = (ap_uint<64>)0;
        }
        bit32 pre_hamming__[156];
        pre_hamming_x47: for (bit32 x47 = 0; x47 < 156; ++x47) {
          pre_hamming__[x47] = 0;
        }
        bit32 hamming_dist1__[26];
        hamming_dist1_x48: for (bit32 x48 = 0; x48 < 26; ++x48) {
          hamming_dist1__[x48] = 0;
        }
        bit32 correct1__;
        correct1_x49: for (bit32 x49 = 0; x49 < 1; ++x49) {
          correct1__ = 0;
        }
        i15: for (bit32 i15 = 0; i15 < 6238; ++i15) {
          i16: for (bit32 i16 = 0; i16 < 26; ++i16) {
            bit32 update8;
            update8_x50: for (bit32 x50 = 0; x50 < 156; ++x50) {
              distance1__[x50] = (hcl_in_train[i15][x50] ^ prototype[i16][x50]);
            }
            bit32 update9;
            update9_x51: for (bit32 x51 = 0; x51 < 156; ++x51) {
              bit32 count___;
              count_x52: for (bit32 x52 = 0; x52 < 1; ++x52) {
                count___ = 0;
              }
              ap_uint<64> numb___;
              numb_x53: for (bit32 x53 = 0; x53 < 1; ++x53) {
                numb___ = distance1__[x51];
              }
              while (((ap_uint<64>)0 < numb___)) {
                count___ = (count___ + 1);
                numb___ = (numb___ & (numb___ - (ap_uint<64>)1));
              }
              pre_hamming__[x51] = count___;
            }
            bit32 sum____;
            sum_x54: for (bit32 x54 = 0; x54 < 1; ++x54) {
              sum____ = 0;
            }
            training_update_m12: for (bit32 m12 = 0; m12 < 156; ++m12) {
              sum____ = ((bit32)(((ap_int<33>)pre_hamming__[m12]) + ((ap_int<33>)sum____)));
            }
            hamming_dist1__[i16] = sum____;
          }
          bit32 pred1__;
          pred1_x55: for (bit32 x55 = 0; x55 < 1; ++x55) {
            pred1__ = 0;
          }
          i17: for (bit32 i17 = 0; i17 < 26; ++i17) {
            if (hamming_dist1__[i17] < hamming_dist1__[pred1__]) {
              pred1__ = i17;
            }
          }
          if (pred1__ == hcl_trainLabels[i15]) {
            correct1__ = (correct1__ + 1);
          }
        }
        float all1__;
        all1_x56: for (bit32 x56 = 0; x56 < 1; ++x56) {
          all1__ = 6.238000e+03f;
        }
        float accuracy1__;
        accuracy1_x57: for (bit32 x57 = 0; x57 < 1; ++x57) {
          accuracy1__ = ((((float)correct1__) / all1__) * 1.000000e+02f);
        }
      }
      bit32 testing_update;
      testing_update_x58: for (bit32 x58 = 0; x58 < 1; ++x58) {
        ap_uint<64> distance1___[156];
        distance1_x59: for (bit32 x59 = 0; x59 < 156; ++x59) {
          distance1___[x59] = (ap_uint<64>)0;
        }
        bit32 pre_hamming___[156];
        pre_hamming_x60: for (bit32 x60 = 0; x60 < 156; ++x60) {
          pre_hamming___[x60] = 0;
        }
        bit32 hamming_dist1___[26];
        hamming_dist1_x61: for (bit32 x61 = 0; x61 < 26; ++x61) {
          hamming_dist1___[x61] = 0;
        }
        bit32 correct1___;
        correct1_x62: for (bit32 x62 = 0; x62 < 1; ++x62) {
          correct1___ = 0;
        }
        i18: for (bit32 i18 = 0; i18 < 1559; ++i18) {
          i19: for (bit32 i19 = 0; i19 < 26; ++i19) {
            bit32 update10;
            update10_x63: for (bit32 x63 = 0; x63 < 156; ++x63) {
              distance1___[x63] = (hcl_in_test[i18][x63] ^ prototype[i19][x63]);
            }
            bit32 update11;
            update11_x64: for (bit32 x64 = 0; x64 < 156; ++x64) {
              bit32 count____;
              count_x65: for (bit32 x65 = 0; x65 < 1; ++x65) {
                count____ = 0;
              }
              ap_uint<64> numb____;
              numb_x66: for (bit32 x66 = 0; x66 < 1; ++x66) {
                numb____ = distance1___[x64];
              }
              while (((ap_uint<64>)0 < numb____)) {
                count____ = (count____ + 1);
                numb____ = (numb____ & (numb____ - (ap_uint<64>)1));
              }
              pre_hamming___[x64] = count____;
            }
            bit32 sum_____;
            sum_x67: for (bit32 x67 = 0; x67 < 1; ++x67) {
              sum_____ = 0;
            }
            testing_update_m13: for (bit32 m13 = 0; m13 < 156; ++m13) {
              sum_____ = ((bit32)(((ap_int<33>)pre_hamming___[m13]) + ((ap_int<33>)sum_____)));
            }
            hamming_dist1___[i19] = sum_____;
          }
          bit32 pred1___;
          pred1_x68: for (bit32 x68 = 0; x68 < 1; ++x68) {
            pred1___ = 0;
          }
          i20: for (bit32 i20 = 0; i20 < 26; ++i20) {
            if (hamming_dist1___[i20] < hamming_dist1___[pred1___]) {
              pred1___ = i20;
            }
          }
          if (pred1___ == hcl_testLabels[i18]) {
            correct1___ = (correct1___ + 1);
          }
        }
        float all1___;
        all1_x69: for (bit32 x69 = 0; x69 < 1; ++x69) {
          all1___ = 1.559000e+03f;
        }
        float accuracy1___;
        accuracy1_x70: for (bit32 x70 = 0; x70 < 1; ++x70) {
          accuracy1___ = ((((float)correct1___) / all1___) * 1.000000e+02f);
        }
      }
    }
  }
