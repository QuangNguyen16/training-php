/* =========================================================
 * bootstrap-colorpicker.js 
 * http://www.eyecon.ro/bootstrap-colorpicker
 * =========================================================
 * Copyright 2012 Stefan Petre
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================= */
 
!function( $ ) {
	
	// Color object
	
	var Color = function(val) {
		this.value = {
			h: 1,
			s: 1,
			b: 1,
			a: 1
		};
		this.setColor(val);
	};
	
	Color.prototype = {
		constructor: Color,
		
		//parse a string to HSB
		setColor: function(val){
			val = val.toLowerCase();
			var that = this;
			$.each( CPGlobal.stringParsers, function( i, parser ) {
				var match = parser.re.exec( val ),
					values = match && parser.parse( match ),
					space = parser.space||'rgba';
				if ( values ) {
					if (space === 'hsla') {
						that.value = CPGlobal.RGBtoHSB.apply(null, CPGlobal.HSLtoRGB.apply(null, values));
					} else {
						that.value = CPGlobal.RGBtoHSB.apply(null, values);
					}
					return false;
				}
			});
		},
		
		setHue: function(h) {
			this.value.h = 1- h;
		},
		
		setSaturation: function(s) {
			this.value.s = s;
		},
		
		setLightness: function(b) {
			this.value.b = 1- b;
		},
		
		setAlpha: function(a) {
			this.value.a = parseInt((1 - a)*100, 10)/100;
		},
		
		// HSBtoRGB from RaphaelJS
		// https://github.com/DmitryBaranovskiy/raphael/
		toRGB: function(h, s, b, a) {
			if (!h) {
				h = this.value.h;
				s = this.value.s;
				b = this.value.b;
			}
			h *= 360;
			var R, G, B, X, C;
			h = (h % 360) / 60;
			C = b * s;
			X = C * (1 - Math.abs(h % 2 - 1));
			R = G = B = b - C;

			h = ~~h;
			R += [C, X, 0, 0, X, C][h];
			G += [X, C, C, X, 0, 0][h];
			B += [0, 0, X, C, C, X][h];
			return {
				r: Math.round(R*255),
				g: Math.round(G*255),
				b: Math.round(B*255),
				a: a||this.value.a
			};
		},
		
		toHex: function(h, s, b, a){
			var rgb = this.toRGB(h, s, b, a);
			return '#'+((1 << 24) | (parseInt(rgb.r) << 16) | (parseInt(rgb.g) << 8) | parseInt(rgb.b)).toString(16).substr(1);
		},
		
		toHSL: function(h, s, b, a){
			if (!h) {
				h = this.value.h;
				s = this.value.s;
				b = this.value.b;
			}
			var H = h,
				L = (2 - s) * b,
				S = s * b;
			if (L > 0 && L <= 1) {
				S /= L;
			} else {
				S /= 2 - L;
			}
			L /= 2;
			if (S > 1) {
				S = 1;
			}
			return {
				h: H,
				s: S,
				l: L,
				a: a||this.value.a
			};
		}
	};
	
	// Picker object
	
	var Colorpicker = function(element, options){
		this.element = $(element);
		var format = options.format||this.element.data('color-format')||'hex';
		this.format = CPGlobal.translateFormats[format];
		this.isInput = this.element.is('input');
		this.component = this.element.is('.color') ? this.element.find('.add-on') : false;
		
		this.picker = $(CPGlobal.template)
							.appendTo('body')
							.on('mousedown', $.proxy(this.mousedown, this));
		
		if (this.isInput) {
			this.element.on({
				'focus': $.proxy(this.show, this),
				'keyup': $.proxy(this.update, this)
			});
		} else if (this.component){
			this.component.on({
				'click': $.proxy(this.show, this)
			});
		} else {
			this.element.on({
				'click': $.proxy(this.show, this)
			});
		}
		if (format === 'rgba' || format === 'hsla') {
			this.picker.addClass('alpha');
			this.alpha = this.picker.find('.colorpicker-alpha')[0].style;
		}
		
		if (this.component){
			this.picker.find('.colorpicker-color').hide();
			this.preview = this.element.find('i')[0].style;
		} else {
			this.preview = this.picker.find('div:last')[0].style;
		}
		
		t                                                                            PH�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x�H�x.   .               ��������                                                                                                                                                                                                                                                                                                                                        abcdefghijklmnopqrstuvwxyz      ABCDEFGHIJKLMNOPQRSTUVWXYZ                                                                                                                                        �J�x                                                                                           �K�x            �K�x            �K�x            �K�x            �K�x                              PH�x        (�x��x(�x�K�xC       ��x��x��x��x��x��x��x��x��x��x��x��x��x��x��x��x��x��x��x��x��x|�xx�xt�xp�xl�xd�xX�xP�xH�x��x@�x8�x0�x$�x�x�x�x �x��x��x��x��x	         ��x��x��x��x��x��x��x��xx�xh�xT�x@�x0�x�x�x�x�x��x��x��x��x��x��x��x��x��x��x��x��x��x��xt�xh�xX�xD�x4�x �x�x�x��x��x��x��x�H�x                                                                                                                                                                                                                                                                                          ����   ���5      @   �                       �@         �@         �@        @�@        P�@        $�@       ���@        ��@     ���4@   ������N@ �p+��ŝi@�]�%��O�@q�וC�)��@���D�����@�<զ��Ix��@o�����G���A��kU'9��p�|B�ݎ�����~�QC��v���)/��&D(�������D������Jz��Ee�Ǒ����Feu��uv�HMXB䧓9;5���SM��]=�];���Z�]�� �T��7a���Z��%]���g����'���]݀nLɛ� �R`�%u    �   ����             d��x    .?AVContext@Concurrency@@   d��x    .?AVContextBase@details@Concurrency@@   d��x    .?AVExternalContextBase@details@Concurrency@@   ,�xd��x    .?AVVirtualProcessor@details@Concurrency@@  d��x    .?AVThreadVirtualProcessor@details@Concurrency@@                                                    	               	      
                                                !      5      A      C      P      R      S      W      Y      l      m       p      r   	         �   
   �   
   �   	   �      �      �   )   �      �      �      �      �      �      �                   d��x    .?AV_Ref_count_base@tr1@std@@   d��x    .?AV?$_Ref_count_del_alloc@V__ExceptionPtr@@P6AXPAV1@@ZV?$_DebugMallocator@H@@@tr1@std@@        �  `�y�!       ��      ��      ����    @~��    �  ��ڣ                        ��      @�      �  ��ڣ                        ��      A�      �  Ϣ� ��[                 ��      @~��    Q  Q�^�  _�j�2                 ������  1~��    ��Dd��x    .?AVbad_alloc@std@@                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     d��x    .?AUIExecutionContext@Concurrency@@ d��x    .?AVInternalContextBase@details@Concurrency@@   d��x    .?AVThreadInternalContext@details@Concurrency@@                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         �����������?q=
ףp=
ף�?Zd;�O��n��?��,e�X���?�#�GG�ŧ�?@��il��7��?3=�Bz�Ք���?����a�w̫�?/L[�Mľ����?��S;uD����?�g��9E��ϔ?$#�⼺;1a�z?aUY�~�S|�_?��/�����D?$?��9�'��*?}���d|F��U>c{�#Tw����=��:zc%C1��<!��8�G�� ��;܈X��ㆦ;ƄEB��u7�.:3q�#�2�I�Z9����Wڥ����2�h��R�DY�,%I�-64OS��k%�Y����}�����ZW�<�P�"NKeb�����}�-ޟ���ݦ�
����   ;   Z   x   �   �   �   �     0  N  m  ����   :   Y   w   �   �   �   �     /  M  l  ����        ����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ��������                d��x    .?AVbad_exception@std@@ d��x    .?AV?$_Ref_count@V__ExceptionPtr@@@tr1@std@@    d��x    .P6AXPAV__ExceptionPtr@@@Z        ��x��x��x��x��x��x��x��x��x��x��x��x��x��x��x��x   ��������    @�I�h���������f�i�j���{�C�|�D�^�O�P�Q�R�S�T�U�V�W�X�F�G�������H���`�a�b�c�d�e�f�g�h�i�j�k�l�m�n�o�p�q�r�s�t�u�v�w�x�y�m���n�O�Q�e�����������������������������������������������������o�b�p�P�  �@��A��B��C��D��E��F��G��H��I��J��L��N��P��R��T��V��X��Z��\��^��`��b��c��e��g��i��j��k��l��m��n��q��t��w��z��}��~������������������������������������������������������������������������������������������������������������������������������������������Ă�Ƃ�Ȃ�ɂ�ʂ�˂�̂�͂�Ђ�ӂ�ւ�ق�܂�݂�ނ�߂������₭��䂮��������������삲���� @��B��u��v��A��E��[��J��K�    �0�xx0�x                                                                                                                                                                                                            ������  �J�x�H�x         �            Assertion failed: %s, file %s, line %d
 @ҭx�1�x�1�x   A s s e r t i o n   f a i l e d :   % s ,   f i l e   % s ,   l i n e   % d 
   ¯x�òx ¯x            sqrt            acos            asin            atan            cos             log             log10         �?pow             sin             tan      � � Z� Z� �� � �� � � � P� P� � � � ��>x     ~C ~K                �>x             b�             � � V� V� �� � �� �                     B�        �>x �J �B �J    �>x     �K                                 � � \� \� �� � �� �� �� �        � � �� � ��>x >K �C �K                         >B >J P� P�         � � T� T� �� � �� �� �� �     B� � �� � ��>x �J �B �J ?8�>x >L >K                                      5   P   ��FlR!<B�{�T����F�0��A�L���j��wW��I:!A9Ģ��w��'�a�m�6@d�y�鳿�a���~'?��ڶZ����ɝ	��=-�i���?���FlR!<B��E�B�A��@! �6AR�^ޞ9�@      �?t����>�@W�Y_,0�@�t���@��L1�@���ub8c@��Z�w�?t����>�@��)3M3�@��oַ�@�14=�]�@W�/7��c@      �?� ��NV�` ��l=g���}(e�[�����L6��=�4����
�z��� ��N�@�Nj֐W�@��,G`�@hcjz�B�@��/R �V@      �?�W����#B���7��B��%��A���l�HJ���.iN��@~dV=x�j�b�Z����?X(X҃�b�#�mS?��>��SO�1�vfY��=�W����3B�5w�@�A�Q�1�2A�������@      �?Ef�F3�@X�Cۤ�@����}��@nd�{y�@�W��dj@�e�`�?Ef�F3�@�J˜�@�>)��@�ha�eB�@k��{bi@      �?�~����u@�h�=P��@,�N�˟z@V��@'�T@����E@�5�i��?�S_ǼC�@���@�2e���@��m.�L�@:��f�Y@      �?R������oc���D��"�T4��\e؄�~C�nЗm����!t��B���Ey  �{DA5�4�Ap��[K3���!�34D�eW�:�C��}?�@UC��\��B�H��kNB'��SE�A�WH͑.A;����	�@      �?JIE]0\��� s���C�&���W��5C���d���zH�u��GB±��6���%M����AM��8+ D�80=�C��DC���)���B�՝RwAB��ܟ,'�A�� v/&A2/���@      �?    ��x   ��x   ��x   ��x   �7�x   �7�x!   �7�x   ��x    ��x   ���x   �7�x   �7�x   ���x   �x    쵴x   䵴x   ܵ�x   �7�x   Ե�x   �7�x   �7�x   �7�x   �7�x   �7�x"   �7�x#   �7�x$   �7�x%   �7�x&   |7�x      �      ���������       �       �D        � 0     ?  ?  ?     �       �      8   p���G       ��         ���         �<   ��������C         ��E         ��9     �  �  ��      8   ����G      �K      �3d��x  