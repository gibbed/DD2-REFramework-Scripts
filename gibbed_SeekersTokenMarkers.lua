--[[

Seeker's Token Markers

by gibbed


https://github.com/gibbed/DD2-REFramework-Scripts/blob/main/gibbed_SeekersTokenMarkers.lua
https://www.nexusmods.com/dragonsdogma2/mods/194


https://gib.me/
https://peoplemaking.games/@gibbed
https://github.com/gibbed
https://www.nexusmods.com/users/85616
https://twitch.tv/gibbed
https://twitter.com/gibbed

]]--

-- Change this to a higher value if you are getting a warning about too many icons.

local map_icon_new_array_size = 1024

-- POINT OF NO RETURN

local token_lookup =
{
  ["02a4d67e-7828-48ab-925d-6c2153dddd4b"] = { x =  1511.327  , y =  72.29001  , z = -1454.527   },
  ["0457ce14-0c4c-4d2b-b2fe-ea15215dbfa6"] = { x = -1182.551  , y =  83.09478  , z =  -972.6376  },
  ["04d9f091-629c-4489-a656-8e240649089f"] = { x =   380.501  , y =  50.62649  , z = -1409.562   },
  ["05a431c3-4be9-4234-a1c0-4dbf8df2249d"] = { x = -1344.502  , y = 124.8171   , z =  -950.6083  },
  ["0711d4ba-24c5-489d-b3a2-730350a63bb7"] = { x =  1444.965  , y =  37.94048  , z = -1504.567   },
  ["086c652d-b1c7-42eb-9746-87437f435a4f"] = { x =  -708.2896 , y =  30.65974  , z =  1312.785   },
  ["09836154-3907-4d3c-b040-a20e2d0a84e9"] = { x = -1836.352  , y =  99.18828  , z =  -257.8879  },
  ["0a488778-4687-41b2-baab-8b0460273475"] = { x = -2323.327  , y =  58.20417  , z =   328.1359  },
  ["0ac6c028-db26-4f6e-83e1-99dd8c05ef1a"] = { x =  -997.5818 , y =  99.78221  , z = -1169.883   },
  ["0af47a47-e191-464e-b465-ef5351c597e3"] = { x =  -208.7119 , y =  75.84951  , z = -1270.892   },
  ["0b00d25d-65d1-4f1a-8e45-68e6ac8160ee"] = { x = -1877.725  , y =  70.39024  , z =   215.3207  },
  ["0c02bc54-ee0a-42b3-b344-8b24447792a0"] = { x =  1253.95   , y =  93.48993  , z = -1971.472   },
  ["0c66515b-3c76-4db2-ae97-97dcd7b39545"] = { x =  -151.6821 , y =  54.35305  , z = -1577.464   },
  ["0c808315-1f0d-4907-8288-ba0600f35478"] = { x =  -421.618  , y =  40.72049  , z = -1217.373   },
  ["0dce5fed-69df-47fb-9381-ffdadfe31929"] = { x =  -425.1481 , y =  31.82341  , z = -1511.35    },
  ["10d3ea5a-8cf4-406a-845d-77b4d389688d"] = { x =  -726.9548 , y =  15.69018  , z = -1057.383   },
  ["11b6d346-d38d-4ac6-ab77-3e47164574e8"] = { x = -1844.405  , y =  49.34726  , z =    53.74813 },
  ["1306226b-ad1f-401b-ab31-8921b6b4b1ee"] = { x = -1175.155  , y = 115.4653   , z = -1422.364   },
  ["14df647e-f951-4684-9b3d-667e31fe26a5"] = { x = -1425.139  , y = 136.3351   , z =   322.1707  },
  ["1500311c-8fb8-4cca-a4e7-68481970a5cb"] = { x =  -954.4528 , y =  59.04977  , z = -1495.011   },
  ["15a68e64-57b5-4d76-8526-4bc18809f7fd"] = { x =  -128.7886 , y = 101.7482   , z = -2144.956   },
  ["1638ee6a-9e04-41f1-89e2-6234e6b49c91"] = { x =  -562.379  , y = 105.0297   , z = -1933.341   },
  ["1779fde9-14f0-458c-b7c4-5d81e1d4a52d"] = { x = -1700.205  , y = 220.8857   , z = -1115.413   },
  ["19584eb4-af0f-48fd-af87-c6199a39a1c0"] = { x = -1627.802  , y = 162.3504   , z = -1446.844   },
  ["19ba6a9a-e257-4a6d-9ed5-2ca9c5c78350"] = { x =  -114.8202 , y =  30.86584  , z = -1187.828   },
  ["1b258f86-2455-43d6-ac38-30121b9e25a7"] = { x = -1864.822  , y =  82.608    , z =   400.1776  },
  ["1b57a637-afde-4ab3-97c4-53f1537e1c0f"] = { x = -1754.728  , y = 205.8057   , z =  -927.3947  },
  ["1d3a4aa3-b613-4c19-8596-e4a2c3fc1f3f"] = { x = -1388.847  , y =  83.21184  , z =   230.7781  },
  ["1df74bfd-8f0f-4c0c-9445-fe0e973963da"] = { x =  -143.9213 , y =  97.7899   , z = -1969.956   },
  ["1e721561-4f63-483a-a8ad-235b95c3a212"] = { x =   333.059  , y = 236.0416   , z = -2672.068   },
  ["222cd53d-df55-4246-a83e-e865c9f23495"] = { x =  -588.8615 , y =  51.29575  , z = -1191.052   },
  ["224b3283-43a6-490d-b740-2b3f58831e83"] = { x =  -351.0987 , y =  72.58118  , z = -1797.945   },
  ["2320c8d1-7c61-4e7d-8210-95b7ca8c46a3"] = { x = -1969.172  , y =  42.60961  , z =   569.0708  },
  ["235649fc-217b-4437-8fad-01125e316435"] = { x =   -74.45094, y =  28.65137  , z = -1228.852   },
  ["238255d3-9548-4440-9b17-b1a640786221"] = { x =  -461.6025 , y =  88.31136  , z =  1461.9     },
  ["24bf79b9-d863-410f-ab51-97cddef2a62b"] = { x =  1427.493  , y =  35.8315   , z = -1567.728   },
  ["255622be-a95d-4998-8f9f-389950dcd210"] = { x =  1241.345  , y = 171.7751   , z = -2249.933   },
  ["2714e565-034b-4be3-959f-db6c501b1490"] = { x =  -868.9569 , y =  15.14516  , z =   902.671   },
  ["292b57e4-f7fb-4df3-8110-8b7861f10152"] = { x =  -562.1972 , y =  27.44761  , z = -1582.972   },
  ["2a6f423d-96ee-42c6-a094-d7a689a0a9db"] = { x = -1983.061  , y = 264.5901   , z =  -890.088   },
  ["2b77f96a-946d-41b2-8bfe-e8ecbbaf0313"] = { x = -1473.602  , y = 158.7904   , z = -1017.371   },
  ["2baa4e20-c128-4b7d-8e3f-7326b925d992"] = { x =   576.5875 , y =  28.66201  , z = -1301.384   },
  ["2c2a2c4d-356e-4363-8ebb-e46d6fce7c74"] = { x =  1301.607  , y =   0.6638163, z = -1370.327   },
  ["2c5aa08c-fa07-4ed0-8a46-c327a84175a2"] = { x = -1037.706  , y =  61.63612  , z = -1543.092   },
  ["2ccf9fd5-7e0e-4400-98bd-06f63e9d5d2c"] = { x = -2290.82   , y = 113.6292   , z =  -406.696   },
  ["2e007612-7d22-4356-bd78-087647a3ecbf"] = { x =  1158.227  , y =   3.896768 , z = -1204.033   },
  ["2f8a2930-2c47-4f7c-bcef-5954d924de38"] = { x =    67.42051, y = 142.9019   , z = -2126.103   },
  ["31330888-e2b6-4687-b575-0dd31ce6851f"] = { x = -2275.997  , y =  71.59417  , z =  -392.5833  },
  ["319a9c61-a635-411f-b289-3f6dabeee45a"] = { x =  -537.8214 , y =   8.304099 , z =  1173.693   },
  ["333ffebf-1108-475a-9360-5faa89299db6"] = { x = -2045.45   , y = 244.2061   , z =  -653.381   },
  ["33928792-ebee-48f8-be7a-a407f31b42d2"] = { x = -1624.109  , y =  69.67034  , z =  1044.009   },
  ["35134c9f-6fd1-4ee5-8f38-796d5cc197ca"] = { x = -1154.636  , y =  99.41915  , z = -1496.902   },
  ["355384aa-bd42-4ca0-bf4e-b42b75eceb9d"] = { x =   368.6974 , y = 192.1294   , z = -2312.887   },
  ["3951ed3f-78e7-4852-bbaa-454e5dcf7752"] = { x =   966.6755 , y =  68.71934  , z = -1654.37    },
  ["39f20bc0-6f6e-492e-8fe4-73b741554102"] = { x =  -531.8324 , y = 140.7443   , z = -2164.448   },
  ["3c1cfdc4-a151-42a2-a42d-5efba66175a0"] = { x = -2231.03   , y = 282.9688   , z =  -817.4234  },
  ["3d901ad5-aaf4-41c2-adfd-4f8bcb952045"] = { x =  -731.689  , y =  24.34222  , z = -1557.463   },
  ["3db44545-cca1-4f0b-9df6-a5c068593893"] = { x = -1800.555  , y =  70.33961  , z =   381.2898  },
  ["3e3170ae-1355-4005-89b8-a42d2fa00982"] = { x =  -669.8233 , y =   5.020011 , z =  -940.93    },
  ["3e66ab77-7a82-471c-a328-547afd1d3d10"] = { x =  -452.4744 , y =  94.03584  , z = -1944.387   },
  ["41fe2f91-4ac5-449e-95e7-5e10fac7d622"] = { x = -2073.348  , y =  87.33474  , z =    13.64392 },
  ["44caf10c-2cab-4df6-8007-09dba7e686f7"] = { x = -1264.083  , y = 103.8367   , z = -1354.126   },
  ["454405b8-3598-46b6-af2a-e5a419e757a8"] = { x = -2058.721  , y =  57.39219  , z =   513.1974  },
  ["464c9f28-67d0-4d14-86e5-ef6729f26036"] = { x =  -443.0493 , y =  42.20091  , z =  -663.1949  },
  ["472c91a7-5ec6-4664-a470-f5915c6a3898"] = { x =  -239.6361 , y =   8.631701 , z =  -838.8901  },
  ["47c0a223-7e9f-4b83-a0b7-8e6a7dbdbc5a"] = { x =   878.4819 , y =  10.14215  , z = -1337.172   },
  ["48f650bc-fe65-437a-ad94-1380451b3ed5"] = { x =   -27.64818, y =   0.6451912, z =  -998.9725  },
  ["4933702a-c54c-41e0-a3db-f8f620139798"] = { x =  1085.92   , y =  61.37453  , z = -1263.965   },
  ["496f1e32-ea11-49d5-8d7e-a70bed10a0ac"] = { x =   505.3856 , y =  63.05507  , z =  -907.8718  },
  ["49c96282-9090-4f8b-8725-1dc39434f6e9"] = { x = -2209.501  , y =  67.62506  , z =   502.0663  },
  ["4a1cea30-3b35-41b1-a723-c5d46283cb42"] = { x = -1169.348  , y = 114.5239   , z = -1078.889   },
  ["4b5bfe87-3356-4b20-9420-e158003d36df"] = { x = -1744.333  , y =  67.46979  , z =   256.7256  },
  ["4bc73098-1b91-4f6b-b0fd-436e21c33849"] = { x =   396.9378 , y =  85.66324  , z =  -820.0371  },
  ["4c6a09d3-d7e7-4fae-b025-3ffe4c534758"] = { x = -2239.501  , y = 290.0148   , z =  1015.552   },
  ["4dd5f7fe-bb89-40b4-869e-bf8df794b915"] = { x = -1063.11   , y = 136.2313   , z =   416.3393  },
  ["50cc649d-90fc-4490-88a6-d460c6ee2722"] = { x =  1133.997  , y = 190.9401   , z = -2244.319   },
  ["50e39898-43cb-4219-865b-e15dcdeaf644"] = { x =  1164.265  , y =  46.84266  , z = -1690.47    },
  ["525b4d12-b694-4881-906d-336ffe62a36a"] = { x =   879.8962 , y = 193.0155   , z = -2363.888   },
  ["54c1024e-f65a-4a15-8d0c-7e1e6d4903ec"] = { x = -1957.176  , y =  90.54247  , z =  -293.5216  },
  ["54e9aefd-2e81-404e-a554-04c57e623071"] = { x =  -321.8596 , y =  62.14732  , z =   861.4832  },
  ["55cbbe12-24bf-4cac-9613-061222602b64"] = { x =   100.7216 , y = 179.9064   , z = -2105.341   },
  ["55f55a78-2be7-4c27-a193-2a1c68c9e86e"] = { x = -2357.598  , y =  83.993    , z =  -196.4987  },
  ["568f6811-7ace-4b39-bd80-0132ef4c4bec"] = { x = -2226.387  , y = 130.6572   , z =  -345.0266  },
  ["573bfd69-20e9-4664-869e-91cf0e3cdb52"] = { x =   -24.78811, y =   9.76271  , z = -1184.259   },
  ["58d7af68-baec-46f8-8fa1-d8c156f27ce1"] = { x =   991.0721 , y =  75.88528  , z = -1753.271   },
  ["5c01a30f-445d-484b-9129-a35e1c265b32"] = { x =  -957.5068 , y =  43.63776  , z = -1013.708   },
  ["5c621dcb-5ec3-4f14-9511-533899dffdcd"] = { x = -1810.451  , y =  37.58649  , z =   857.5712  },
  ["5e09448e-410b-4935-be7b-0e8e170feb08"] = { x = -2052.696  , y = 158.5537   , z =   966.871   },
  ["5fa4e986-4f65-498e-81f2-771995985312"] = { x = -1143.138  , y =  87.47182  , z = -1574.525   },
  ["5fa82bb5-ac1d-4063-b661-ca613288e0cc"] = { x =   196.2978 , y = 167.8351   , z = -2355.079   },
  ["5fd47f96-cbdf-40c4-bf4c-e84621621180"] = { x = -1412.043  , y =     157    , z =   334.4911  },
  ["60fe72a8-a820-4a10-b700-478e99164241"] = { x = -1669.654  , y =  50.81789  , z =   966.7512  },
  ["6170658c-9fa3-43ae-85fc-a4451a17f3e9"] = { x = -2000.453  , y =  83.90808  , z =   -85.11404 },
  ["61a82e35-1a79-4172-9615-bd96c5388ed4"] = { x = -2288.28   , y =  61.76313  , z =   160.2155  },
  ["63777e5c-99c5-4cd5-a2ca-c9c56386d5c8"] = { x = -1744.999  , y =  52.29864  , z =   729.0167  },
  ["6391a63f-5fd2-4fe9-9455-e2a9f4bd7221"] = { x =  1213.163  , y =   7.444563 , z = -1307.155   },
  ["689086a3-ae83-4ce5-9f2d-24a4eb9703f0"] = { x =  1451.397  , y =  30.69706  , z = -1425.217   },
  ["698db9ee-4255-4c3f-8d14-236e30578e40"] = { x =  1246.022  , y =  85.96709  , z = -1719.665   },
  ["69dff1ec-837e-44fa-839c-f32e042071f7"] = { x =  -377.4244 , y =  25.65013  , z =  1072.151   },
  ["6a6af578-f651-4632-bc04-924fb511e4ce"] = { x =  -362.2318 , y =  27.21784  , z =  1137.943   },
  ["6abaa9ae-a328-4aa3-9eae-69b6bc643e0a"] = { x =  -311.1265 , y =  46.33576  , z = -1172.065   },
  ["6b9c9d58-702e-4d51-a234-86a7916a506b"] = { x = -1863.659  , y =  53.75474  , z =   564.1379  },
  ["6e6ba695-133c-46df-9238-7654ee4985a0"] = { x =    87.88998, y = 275.9138   , z = -2699.498   },
  ["6f8bb4d1-31db-4ecc-916a-fd693af60152"] = { x =   497.4532 , y =  66.13264  , z =  -931.752   },
  ["70597af8-bfc1-45bd-8d32-c628a103cfa1"] = { x = -1947.701  , y = 106.3777   , z =  -142.9371  },
  ["70947cb6-1db4-4cce-bf12-57fd8df1fea2"] = { x = -1992.826  , y = 211.1146   , z =  -553.046   },
  ["71e1e7d5-0b03-4483-b085-9c61943660f4"] = { x = -1916.496  , y = 243.5359   , z =  -897.6821  },
  ["72821825-5dd3-41a6-86b4-3e75e3b50e0a"] = { x =  -413.092  , y = 100.2532   , z = -1961.737   },
  ["732bf65e-d26c-476b-9ed1-778b2bd38793"] = { x = -2087.02   , y =  41.7835   , z =   196.835   },
  ["74643fe3-be9d-48b7-8a28-71021b0afe19"] = { x =   155.5486 , y =  85.44305  , z =  1108.05    },
  ["74992bb8-3130-413e-8667-cd26f8f97120"] = { x =  -215.3959 , y =  39.77499  , z = -1228.676   },
  ["763aa1dc-d101-4dae-9b3e-35bca5f3a10c"] = { x =   406.3369 , y =  45.64609  , z =  -978.3323  },
  ["76b23eda-0860-4a12-8148-d9166632945b"] = { x =  -662.3477 , y =  22.74153  , z = -1335.208   },
  ["771bf194-f1e5-4fda-a3af-adfe486f2cd8"] = { x =  -471.8372 , y =  30.35632  , z =  1167.059   },
  ["775296f2-6e91-4839-9f44-b0cc9f798029"] = { x =  -985.4307 , y =  48.5821   , z =  -302.3444  },
  ["777afcf5-ddc9-480e-a9e5-2311415a16b9"] = { x =  -691.2465 , y =  17.03014  , z =   674.2273  },
  ["783cec58-5045-4ae2-8e4a-1b1ddbc7e4cc"] = { x =    44.64841, y = 148.8826   , z = -2307.236   },
  ["7872eaf1-4e55-4d76-9816-1ecc254d241b"] = { x = -2050.989  , y = 114.8949   , z =  -383.0466  },
  ["78d34730-086a-451b-bafd-2fa6e6a3a1de"] = { x = -1410.486  , y = 144.7303   , z = -1389.202   },
  ["7b182a98-7e2c-4c56-a483-b2593887f8be"] = { x = -1040.184  , y =   0.4392352, z =  1258.829   },
  ["7cdd5b42-2693-45b7-b791-f8349f0fe6f3"] = { x =  -452.9087 , y =   0.796546 , z =   741.597   },
  ["7e5847b4-d2ec-4f58-b171-a2c5317dace9"] = { x =   334.2993 , y = 100.3809   , z =  1323.854   },
  ["7ea5c706-4e17-475f-a04b-4df34ebac0a7"] = { x = -1558.879  , y =  85.9902   , z =   429.7581  },
  ["7fe34a30-64fc-452b-a649-56b0a90fc4b9"] = { x =  1253.134  , y =  67.67858  , z = -1870.294   },
  ["8083bd9d-911e-466e-a539-b84de0c3adec"] = { x = -2175.953  , y =  75.2403   , z =   513.1131  },
  ["810dbf2f-8cbe-4c4e-9dee-081dff1d6d02"] = { x =   486.8091 , y =  24.38745  , z = -1054.205   },
  ["82523cec-d6af-4989-9901-ea0819ade054"] = { x = -1145.974  , y =  46.43586  , z =  -255.1327  },
  ["82a26196-a463-444f-b80b-a571441b9a55"] = { x =   802.7636 , y =  10.00694  , z = -1275.782   },
  ["83141447-e609-43a5-8202-e599db24ceea"] = { x =  -257.8826 , y =  50.04342  , z =   769.1068  },
  ["8393ad93-d6e9-4e32-b04d-49325e01f1cd"] = { x =  -256.1795 , y =  29.35168  , z =  1128.872   },
  ["83a7cbac-3a8f-4317-b386-3d311ac3f768"] = { x =   -29.33716, y = 164.9512   , z = -2487.574   },
  ["845a8da9-9395-4374-bc65-2a42bb1deaaa"] = { x = -2438.648  , y = 297.7558   , z =  -729.283   },
  ["888c14a1-aa0d-4667-b58a-452186dd9a23"] = { x = -1735.35   , y =  67.04755  , z =   604.192   },
  ["894615cf-6cb3-4246-823b-5caa9477f18b"] = { x = -2437.834  , y =  75.30431  , z =  -279.8528  },
  ["896e9aba-caf5-4fef-be01-9640bd89b88e"] = { x = -1467.244  , y = 167.842    , z =  -972.6749  },
  ["8e9de8ff-7456-48e8-8eb2-ae25fd431b53"] = { x = -1144.316  , y =  59.95095  , z =   -37.65364 },
  ["8fedb69f-068d-4567-9b0c-1b5001e76c1d"] = { x = -2205.891  , y =  37.86744  , z =   416.3837  },
  ["90c54e21-73d7-4d71-a21d-51c2d8341159"] = { x = -1325.521  , y = 153.6144   , z =   318.1047  },
  ["9188ef59-b14c-4cdb-9d53-c16d5519d54b"] = { x = -1726.722  , y =  96.89873  , z =    19.04225 },
  ["921388e2-638e-4217-920f-4c25823fb117"] = { x = -1455.78   , y = 107.9478   , z =   276.0348  },
  ["93e02712-1cfc-43b5-ad3b-69a536150747"] = { x =    14.76145, y = 190.1257   , z = -2412.495   },
  ["950f500a-5d2d-40f6-a588-16fcc0d64e80"] = { x = -2081.739  , y =  81.17527  , z =  -169.5074  },
  ["97a0b944-3dcf-45ec-890e-7aec2304943e"] = { x = -2195.761  , y =  82.26016  , z =  -148.4175  },
  ["9913c5dc-db1c-4d24-93c4-d67a46436c9a"] = { x =   509.7451 , y =  20.81026  , z = -1124.374   },
  ["993a8bae-9d02-4fbb-a0e0-bc9bb78d5772"] = { x = -1128.958  , y =  78.22768  , z =   389.9597  },
  ["99750d3f-87e7-48fe-b2f2-3227fd4252ae"] = { x =   378.7181 , y =  44.0754   , z = -1047.653   },
  ["99de32e1-e520-4273-8035-a7f68f158097"] = { x =  1094.016  , y =  61.32773  , z = -1263.995   },
  ["9b9df433-566c-4687-a16b-cb0656072710"] = { x = -1059.732  , y =  80.43699  , z =   239.3768  },
  ["9bb5b5f8-cc95-4451-bc3b-46bb45000bc8"] = { x =  -300.6327 , y =  22.67523  , z = -1187.099   },
  ["9c19f3b7-6940-4b65-9606-f7a912d90f1b"] = { x = -2117.376  , y = 223.6917   , z =  1044.149   },
  ["9eb90b3a-2ff3-4172-a73a-f09a9f5016ee"] = { x = -2096.548  , y = 143.9485   , z =   897.7155  },
  ["a0107cb6-a2d6-4b57-97a6-4e9b7cdda934"] = { x = -1017.941  , y =  26.8972   , z =   160.796   },
  ["a367afa0-ec3b-4706-89b9-ef8791a94fc1"] = { x = -1190.294  , y = 102.4365   , z =   319.5692  },
  ["a47f4acd-63e3-4a46-b98a-99e7b32a7faf"] = { x =   889.1685 , y =  20.1433   , z = -1190.647   },
  ["a4ea4201-901f-4aeb-9c4c-ada69d855537"] = { x =  -930.7362 , y =  37.33437  , z =  -730.5226  },
  ["a7205e13-d709-4b8d-b716-293933585f7b"] = { x =    81.20549, y =  69.3      , z = -1748.368   },
  ["a73df479-bb10-4312-8307-c17002d9daae"] = { x =   928.5052 , y = 240.082    , z = -2586.659   },
  ["a775e612-2a01-4017-8f23-64734d267488"] = { x =  1074.255  , y =  49.43904  , z = -1615.228   },
  ["a7d21cbb-ddb5-4cf4-9e4f-d348eb19a4a3"] = { x = -1385.482  , y = 110.7523   , z = -1279.451   },
  ["ab45a1ab-7846-49f6-9992-5ea4e6a5c653"] = { x =  -175.3369 , y =  75.17094  , z = -1411.751   },
  ["ad805c07-ff91-489c-8a17-aee577632fd5"] = { x = -1893.107  , y =  35.35776  , z =   756.4501  },
  ["ae96eb6e-063e-40c2-a0a8-0289ef7b7c38"] = { x =  -489.7266 , y =  18.02133  , z = -1064.699   },
  ["b1295e58-2871-4d0e-8a7a-fbf7254b80b3"] = { x =  1215.604  , y =  76.60162  , z = -1907.77    },
  ["b1eda617-057c-49ea-b786-ef003618af3e"] = { x = -1623.225  , y =  86.3857   , z =   291.1531  },
  ["b346c5c7-a328-4ffa-a4e4-9fec4cc601f0"] = { x =   371.4242 , y =  78.0455   , z =  -881.5969  },
  ["b395e0d9-7118-4733-9b45-9c5ea780079e"] = { x = -1547.166  , y =  69.55149  , z =  1078.691   },
  ["b3f81b13-322b-46ae-998e-87b431dd1457"] = { x =   923.5192 , y = 195.4502   , z = -2313.818   },
  ["b4de45d0-3f62-4c77-bb88-1e2514b91b70"] = { x =  -593.5593 , y =  50.08264  , z = -1789.409   },
  ["b78f56ab-66c1-4707-b198-337cc6f6dfa7"] = { x =  -967.5819 , y =  13.6438   , z =  -234.7076  },
  ["b8b875d4-234f-4a71-a0d7-5463bf3e6843"] = { x =  -554.0727 , y =  35.60732  , z = -1033.871   },
  ["b8f2639e-ee4d-4372-8252-eef9752b0833"] = { x = -1707.572  , y =  85.18982  , z =   114.9935  },
  ["b989ca6c-1ab8-41ab-affd-52d8bdfc1d72"] = { x = -1307.999  , y = 148.0497   , z = -1420.194   },
  ["ba0c0526-a1ce-45da-9cc7-c7a4399ef9d2"] = { x = -1058.136  , y =  97.33194  , z =   400.906   },
  ["ba11aea5-84d7-463e-8982-99cb4925c2f4"] = { x =  1284.713  , y =  29.37333  , z = -1253.282   },
  ["baee3b1d-489d-4506-8bee-e9847537158c"] = { x = -1737.472  , y = 191.269    , z = -1190.988   },
  ["baf0fef2-4e5c-4152-a73c-91db9e4733cf"] = { x = -2144.98   , y = 237.7022   , z =   931.1352  },
  ["bb047a4b-1340-4c11-bbe3-7cd2b6288939"] = { x =  -744.014  , y =  37.91385  , z = -1269.364   },
  ["bcc7d3d3-434a-40ac-b385-78eed31b2e2b"] = { x = -2206.928  , y =  76.91254  , z =   370.2791  },
  ["c05a06a6-d9dc-4015-8bee-f0c2e66d5d80"] = { x =   824.2649 , y = 231.7646   , z = -2651.551   },
  ["c4448b11-6186-4496-97a3-e181cb9f6102"] = { x =  -460.4371 , y =  21.96133  , z =  -868.7405  },
  ["c58f4eac-3b27-450e-9fc0-16026c4df02f"] = { x =   530.9937 , y =  -1.72881  , z =  -949.6918  },
  ["c7bfe736-1fdb-4764-8445-a8534f1909bb"] = { x =   459.0298 , y =  76.78581  , z =  -719.246   },
  ["c8023484-291f-467d-aefc-5d791f3c08d9"] = { x = -1907.512  , y = 194.0277   , z =  -539.9005  },
  ["c806e6a5-b5ec-4b7d-91c5-b1006b625776"] = { x =   310.7063 , y =   2.663232 , z = -1093.182   },
  ["c821951f-55cc-4ec1-a147-df293b145e1b"] = { x = -2090.685  , y =  87.91904  , z =  -252.9724  },
  ["c8793455-ee1c-40b3-8c2d-0e51dd6091d4"] = { x = -1545.581  , y = 168.1623   , z = -1526.813   },
  ["c890ab07-2357-4013-8397-4b7a6b09c0cb"] = { x =  -900.6052 , y =  -0.4724793, z =   -41.89881 },
  ["ca589d84-da43-4eda-8ced-f53fbfc2236a"] = { x =  1188.915  , y =  38.70578  , z = -1399.902   },
  ["ca9962b7-a597-404a-a047-7ce352b946c4"] = { x = -1592.083  , y = 166.3117   , z = -1439.994   },
  ["caeed7eb-7116-4679-825f-f4495cd6930e"] = { x =    59.92789, y = 221.4001   , z = -2591.599   },
  ["cbdc540f-5814-4887-a9b3-05a93c6d239b"] = { x =    17.31717, y =  95.44806  , z = -2068.056   },
  ["cc20e5df-e42a-47cf-b985-b991c4333171"] = { x =  1294.648  , y =  32.48453  , z = -1162.289   },
  ["ce36c014-824e-43c4-a667-6628a8ed1c31"] = { x =  -988.0832 , y =  29.20226  , z =  1193.494   },
  ["d0731ab4-3e67-4332-b610-f4575efbb8cd"] = { x =  1087.994  , y =  42.86492  , z = -1509.454   },
  ["d1b83278-83d0-4f6e-93ed-50a5b36d9ee4"] = { x =   390.7802 , y =  24.44314  , z = -1063.17    },
  ["d24a592a-1648-4286-b7df-8074fc87f77c"] = { x =   334.6868 , y = 206.1537   , z = -2521.229   },
  ["d303538c-8c0e-4075-8aa7-5bdf660d4a85"] = { x =  1180.006  , y =  65.77381  , z = -1937.357   },
  ["d30b3cdb-07d9-41cf-8fa0-cd9c2fcd7caf"] = { x =  -892.7271 , y =  29.77627  , z =  -720.5415  },
  ["d311dc31-c838-447b-8de8-2fea8b972678"] = { x =   542.3516 , y =  15.91502  , z = -1215.642   },
  ["d3291ac4-cb2c-4dd9-9d58-31e49016eea0"] = { x =  1506.107  , y =  28.23366  , z = -1357.404   },
  ["d5301ca3-8246-4218-800a-7cecf960ee54"] = { x = -2200.933  , y = 296.0031   , z =  1054.443   },
  ["d54d4754-504e-48ec-9651-be40cbd2a9b3"] = { x =   458.9755 , y =  46.67035  , z = -1029.605   },
  ["d5b88750-9389-4585-a5c1-0340ebd64f78"] = { x = -1860.29   , y =  85.47575  , z =  -437.5429  },
  ["d65f7a00-a17e-4f2b-b51e-c41a35831c66"] = { x = -1121.143  , y =  79.09875  , z = -1639.249   },
  ["d67bd543-6402-418c-a495-f50a40cb93e9"] = { x =   942.6032 , y =  -0.3656093, z = -1232.318   },
  ["d6d00541-9171-4893-90fd-e540a1383c46"] = { x =  -477.5305 , y =  87.42719  , z =  1420.187   },
  ["d8bdbc5b-fcbe-4be4-b93a-3a499cf7450c"] = { x =  1091.268  , y =  25.77886  , z = -1428.777   },
  ["d8ca19c6-717c-4dc7-90f1-9150d25fa21e"] = { x = -1820.409  , y =  98.10882  , z =   -87.64505 },
  ["d9d35a9a-6fce-40cc-b173-5fe3f0e129c1"] = { x =  -996.6234 , y = 104.1155   , z = -1290.778   },
  ["da4d8193-23aa-4c95-bdf9-1a12ea6daf49"] = { x =  -806.2393 , y =  30.66521  , z =  -947.8731  },
  ["db5e4027-0700-4383-85e8-dffa2d65f9c3"] = { x =   180.126  , y =  26.03245  , z = -1161.688   },
  ["de93e359-3d0b-4873-ab58-a98f73d0e845"] = { x = -1670.075  , y =  99.82407  , z = -1280.521   },
  ["df312e2b-a6c0-406d-8b82-d3f8c3e5ecc8"] = { x = -1101.613  , y = 114.1108   , z =   612.7404  },
  ["e16c8e3a-f108-4a55-9fc8-c9015defd1c8"] = { x =   512.6115 , y =  44.41759  , z =  -960.8672  },
  ["e5a3a8f6-18cf-4e7d-b26b-d1c441e815d9"] = { x =  -597.4287 , y =   0.2458094, z =  -842.9684  },
  ["e720ba3d-b61e-459a-aaf0-94dc089cd62b"] = { x =  1148.682  , y =  23.13101  , z = -1390.438   },
  ["e7d2ede4-aea2-42be-8552-9f44d41e01b0"] = { x = -1709.469  , y =  53.84142  , z =  1102.876   },
  ["ea3fb16f-d0bb-4093-8618-7f4c9d59beae"] = { x = -2390.223  , y = 272.1731   , z =  -619.5712  },
  ["ec6dca46-d5a7-4ba6-92f2-ae5346237d14"] = { x =  -546.9639 , y =  96.17853  , z = -1880.174   },
  ["ec7802da-26fc-40c1-a862-7c38ed44f6d6"] = { x = -2008.847  , y = 124.2037   , z =   945.9615  },
  ["ee02aa1d-4a81-4eba-aea8-774b883ceaca"] = { x = -2403.851  , y = 315.0301   , z =  -879.7818  },
  ["f0313c56-9563-411c-bf94-b1d691a51b8e"] = { x =  -313.1738 , y =  49.01183  , z =  1247.046   },
  ["f03d1863-e81f-478d-990c-d13da19f466b"] = { x =  -492.7277 , y = 130.1809   , z = -2259.106   },
  ["f0470d31-e33f-4d34-ac3d-48cf81df025d"] = { x =   597.8867 , y =  80.00896  , z =  -854.4315  },
  ["f04ada2c-0ac3-477a-a543-73b312e11d13"] = { x = -1346.704  , y = 120.433    , z =   398.7322  },
  ["f0d4fcf0-d1e7-473e-a224-38b2c166ce0e"] = { x = -1941.606  , y =  77.46495  , z =  -340.7309  },
  ["f2803dfe-160b-4282-abf4-e997bdf214e4"] = { x =  -804.2957 , y =  44.27563  , z = -1351.228   },
  ["f2d9e005-623d-4cd8-8c29-1bc2076f935a"] = { x =  -347.2373 , y =  53.32834  , z =  -884.2132  },
  ["f392734e-a1ee-48ff-9f1d-f109fdc05135"] = { x =  1564.457  , y =  62.45671  , z = -1439.98    },
  ["f4de34eb-2058-4bf3-a710-78c4401b2b6f"] = { x = -1787.815  , y =  48.46006  , z =   669.9354  },
  ["f5e5c8dd-19ce-4644-bec8-7f1fabc97b55"] = { x =  -661.7025 , y =  38.82969  , z = -1069.028   },
  ["f6c43c28-3505-494f-bfc3-11f443a3f410"] = { x = -1101.07   , y =  98.0107   , z = -1134.8     },
  ["f8f94a06-dd83-40e1-aa8e-3763386360e1"] = { x =   888.7634 , y =   0.3689132, z = -1230.208   },
  ["f957a3c5-3afd-49ac-ae2c-395c209986f6"] = { x =  -939.8016 , y =  67.41076  , z = -1248.607   },
  ["fa72d2f3-c8bf-4c41-a4eb-d25f60c66ea1"] = { x = -1929.849  , y = 179.5838   , z = -1146.239   },
  ["fbe75b09-7960-43d5-9025-c0c1815ed270"] = { x =  1055.01   , y =  50.11625  , z = -1245.982   },
  ["fcbda279-90e3-4e0d-9f04-dec6b58c2fd2"] = { x = -2454.656  , y = 158.9566   , z =  -551.7483  },
  ["fdb69c78-37b2-4ef4-9ec9-43ca2d4e1074"] = { x =  -759.3116 , y =  16.65483  , z =  1249.993   },
  ["fdf25c99-5446-4398-8a3e-c42fad75e360"] = { x =   494.4174 , y =  14.7665   , z = -1284.163   },
  ["fe974572-0cc0-4ba2-bd22-e9f82b0db456"] = { x =  -381.5288 , y =   8.838051 , z =  -827.5795  },
}

local int_type = sdk.find_type_definition("System.Int32")
local int_type_value_offset = int_type:get_field("m_value"):get_offset_from_base()
local unique_id_type = sdk.find_type_definition("app.UniqueID")
local ui_type = sdk.find_type_definition("app.ui040205")
local map_icon_info_type = sdk.find_type_definition("app.GuiManager.MapIconInfo")
local map_icon_ref_type = sdk.find_type_definition("app.GUIBase.MapIconRef")

local guid_parse = sdk.find_type_definition("System.Guid"):get_method("Parse")
local array_resize = sdk.find_type_definition("System.Array"):get_method("Resize")

-- The message for "Seeker's Token" in natives/stm/message/ui/itemname.msg.22
local name_guid = guid_parse(nil, "e26516a9-39b1-4e5d-a814-34aba7c7e023")

local markers_enabled = true
local show_acquired = false
local want_update = false

local marker_label = "Open the map!"
local update_marker_count = function(count)
  marker_label = tostring(count) .. " shown"
end

local ui_map = nil

-- settings!
re.on_draw_ui(function()
  if imgui.tree_node("Seeker's Token Markers") then
    if marker_label ~= nil then
      imgui.text(marker_label)
    end
    if show_warning then
      imgui.text("Reached the icon limit! Markers limited. You can try increasing map_icon_new_array_size in the script file.")
    end
    local changed, new_value = imgui.checkbox("Enabled", markers_enabled)
    if changed then
      markers_enabled = new_value
      if ui_map ~= nil and ui_map:get_Valid() then
        want_update = true
      end
    end
    local changed, new_value = imgui.checkbox("Show Acquired", show_acquired)
    if changed then
      show_acquired = new_value
      if ui_map ~= nil and ui_map:get_Valid() then
        want_update = true
      end
    end
    imgui.tree_pop()
  end
end)

-- hook constructor so we can resize MapIcon array to be larger
sdk.hook(
  ui_type:get_method(".ctor"),
  function(args)
    ui_map = sdk.to_managed_object(args[2])
  end,
  function(retval)
    local this = ui_map
    this.MapIcon = sdk.create_managed_array(map_icon_ref_type, map_icon_new_array_size)
    return retval
  end
)

-- hook onDestroy to reset ui_map since the object is recreated whenever the map is opened
sdk.hook(
  ui_type:get_method("onDestroy"),
  function(args)
    ui_map = nil
  end,
  function(retval)
    return retval
  end
)

-- hook update so that setupMapIcon is called from within the UI thread (assumed) to avoid crashing calling it directly
sdk.hook(
  ui_type:get_method("update"),
  function(args)
    if want_update == false then
      return
    end
    want_update = false
    local this = sdk.to_managed_object(args[2])
    this:setupMapIcon()
  end,
  function(retval)
    return retval
  end
)

-- doot!
sdk.hook(
  ui_type:get_method("setupMapIcon"),
  function(args)
    ui_map = sdk.to_managed_object(args[2])
  end,
  function(retval)
    if markers_enabled == false or ui_map == nil then
      return
    end

    local this = ui_map

    local generate_manager = sdk.get_managed_singleton("app.GenerateManager")

    local proof_id = sdk.get_managed_singleton("app.GimmickManager"):get_FirstSeekerProof()
    local proof_key = nil
    if proof_id:isEmpty() == false then
      proof_key = proof_id:get_RowID():ToString()
    end

    local icon_cap = this.MapIcon:get_Length()
    local icon_count = this.MapIconInfoList:get_Count()

    -- passed in as ref to addMapIconInfoList
    local icon_index_obj = int_type:create_instance()
    icon_index_obj:write_dword(int_type_value_offset, icon_count)

    show_warning = false
    local marker_count = 0
    for token_key, token_pos in pairs(token_lookup) do
      repeat
        local icon_index = icon_index_obj:read_dword(int_type_value_offset)
        if icon_index >= icon_cap then
          show_warning = true
          break
        end

        if show_acquired == false then
          -- If the proof matches the token's unique id, then it's been picked up
          if proof_key ~= nil and proof_key == token_key then
            break
          end

          -- If the token has been flagged to never generate then it's been picked up
          local token_guid = guid_parse(nil, token_key)
          local token_id = unique_id_type:create_instance()
          token_id:setup(token_guid, 0)
          if generate_manager:isNeverGenerate(token_id) == true then
            break
          end
        end

        -- Create a custom icon...
        local info = map_icon_info_type:create_instance()
        info.IsEnable      = true
        info.IsNavi        = false
        info.IconId        = 0
        info.SortNo        = 0
        info.UniqId        = token_id
        info.IconType      = 56
        info.Timing        = 0
        info.Pos           = Vector3f.new(token_pos.x, token_pos.y, token_pos.z)
        info.Area          = -1 -- app.AIAreaDefinition.None
        info.LocalArea     = 0 -- app.AILocalAreaDefinition.None
        info.IsDispAllArea = true

        -- ...and add it to the map
        this:addMapIconInfoList(info, 0, icon_index_obj:get_address() + int_type_value_offset, -1, name_guid)

        marker_count = marker_count + 1
      until true
    end
    update_marker_count(marker_count)

    return retval
  end
)
