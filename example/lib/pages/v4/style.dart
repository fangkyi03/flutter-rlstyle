import 'package:rlstyles/Component/CssRule.dart';
import 'package:rlstyles/main.dart';

getV4Style() {
  return {
    'main': {
      CssRule.flexDirection: 'column',
      CssRule.backgroundColor: '#f5f5f5',
      CssRule.width: double.infinity,
      CssRule.height: double.infinity
    },
    'header': {
      CssRule.height: 50,
      CssRule.backgroundColor: 'rgb(241, 80, 59)',
      CssRule.alignItems: 'center',
      CssRule.justifyContent: 'center',
      CssRule.flexDirection: 'row',
      CssRule.width: double.infinity
    },
    'header-left': {
      CssRule.position: 'abs',
      CssRule.top: 0,
      CssRule.bottom: 0,
      CssRule.left: 0,
      CssRule.width: 80,
      CssRule.alignItems: 'center',
    },
    'header-right': {
      CssRule.right: 0,
      CssRule.top: 0,
      CssRule.bottom: 0,
      CssRule.width: 50,
      CssRule.position: 'abs',
      CssRule.justifyContent: 'center',
      CssRule.alignItems: 'center',
      CssRule.color: 'white'
    },
    'header-input': {
      CssRule.justifyContent: 'center',
      CssRule.alignItems: 'center',
      CssRule.width: '100%',
      CssRule.height: '100%',
    },
    'header-input-view': {
      CssRule.width: '60%',
      CssRule.height: '60%',
      CssRule.alignItems: 'center',
      CssRule.justifyContent: 'center',
      CssRule.backgroundColor: '#f5f5f5',
      CssRule.borderRadius: 25,
      CssRule.paddingLeft: 10
    },
    'header-logo': {
      CssRule.color: 'rgb(241, 80, 59)',
      CssRule.width: 30,
      CssRule.alignItems: 'center',
      CssRule.justifyContent: 'center',
      CssRule.borderRightColor: 'red',
      CssRule.marginRight: 5
    },
    'swiper': {
      CssRule.marginTop: 20,
      CssRule.backgroundColor: 'blue',
      CssRule.width: 300,
      CssRule.height: 120
    },
    'icon-group': {
      CssRule.flexWrap: 'wrap',
      CssRule.display: 'grid',
      CssRule.gridCount: 5
    },
    'icon-img': {
      CssRule.height: 50,
      CssRule.width: 50,
      CssRule.borderRadius: 25,
      CssRule.backgroundSize: 'cover',
      CssRule.paddingTop: 10
    },
    'icon-item': {
      CssRule.flexDirection: 'column',
      CssRule.justifyContent: 'center',
      CssRule.alignItems: 'center',
      // CssRule.width: '20%',
      CssRule.height: 80
    },
    'active': {
      CssRule.marginLeft: 15,
      CssRule.marginRight: 15,
      CssRule.backgroundColor: 'white',
      CssRule.borderRadius: 10,
      CssRule.width: double.infinity,
      CssRule.marginTop: 10,
      CssRule.height: 150,
      CssRule.flexDirection: 'column',
      CssRule.paddingLeft: 10,
      CssRule.paddingRight: 10
    },
    'active-header': {
      CssRule.height: 30,
      CssRule.alignItems: 'center',
      CssRule.justifyContent: 'space-between',
      CssRule.width: double.infinity,
      CssRule.fontSize: 12,
    },
    'active-group': {
      CssRule.width: '100%',
      CssRule.height: 70,
    },
    'active-item': {
      CssRule.flexDirection: 'column',
      CssRule.justifyContent: 'center',
      CssRule.alignItems: 'center',
      CssRule.flex: 1,
    },
    'list': {
      CssRule.flex: 1,
      CssRule.backgroundColor: 'blue',
      CssRule.height: 500,
      CssRule.marginTop: 20
    }
  };
}
