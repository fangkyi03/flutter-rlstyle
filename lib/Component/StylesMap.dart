import 'package:rlstyles/Component/Styles.dart';

class StylesMap extends Styles {
  static getClass(Map keyName, Map classMap) {
    final arr = [];
    keyName.keys.forEach((element) {
      if (keyName[element]) {
        arr.add(element);
      }
    });
    Map obj = {};
    arr.forEach((element) {
      obj = {...obj, ...classMap[element]};
    });
    return obj;
  }

  static formMap(Map mapData) {
    return Styles(
        display: mapData['display'] ?? 'flex',
        flexDirection: mapData['flexDirection'] ?? 'column',
        color: mapData['color'],
        flex:mapData['flex'],
        width: mapData['width'],
        height: mapData['height'],
        flexWrap: mapData['flexWrap'],
        flexWrapSpacing: mapData['flexWrapSpacing'] ?? 0.0,
        flexWrapRunSpacing: mapData['flexWrapRunSpacing'] ?? 0.0,
        justifyContent: mapData['justifyContent'],
        alignItems: mapData['alignItems'],
        borderRadius: mapData['borderRadius'],
        marginLeft: mapData['marginLeft'],
        marginTop: mapData['marginTop'],
        marginRight: mapData['marginRight'],
        marginBottom: mapData['marginBottom'],
        paddingLeft: mapData['paddingLeft'],
        paddingTop: mapData['paddingTop'],
        paddingRight: mapData['paddingRight'],
        paddingBottom: mapData['paddingBottom'],
        left: mapData['left'],
        top: mapData['top'],
        right: mapData['right'],
        bottom: mapData['bottom'],
        position: mapData['position'] ?? 'rel',
        backgroundImage: mapData['backgroundImage'],
        backgroundColor: mapData['backgroundColor'],
        maxWidth: mapData['maxWidth'],
        maxHeight: mapData['maxHeight'],
        fontSize: mapData['fontSize'],
        textOverflow: mapData['textOverflow'],
        fontWeight: mapData['fontWeight'],
        fontFamily: mapData['fontFamily'],
        whiteSpace: mapData['whiteSpace'],
        lineHeight: mapData['lineHeight'],
        textDecoration: mapData['textDecoration'],
        overflow: mapData['overflow'],
        lines: mapData['lines'],
        boxSizing: mapData['boxSizing'],
        borderWidth: mapData['borderWidth'],
        borderStyle: mapData['borderStyle'],
        borderColor: mapData['borderColor'],
        opacity: mapData['opacity'] ?? 1.0,
        boxShadow: mapData['boxShadow'],
        textAlign: mapData['textAlign'],
        minHeight: mapData['minHeight'],
        minWidth: mapData['minWidth'],
        borderBottomLeftRadius: mapData['borderBottomLeftRadius'],
        borderBottomRightRadius: mapData['borderBottomRightRadius'],
        borderLeftStyle: mapData['borderLeftStyle'],
        borderLeftColor: mapData['borderLeftColor'],
        borderLeftWidth: mapData['borderLeftWidth'],
        borderRightStyle: mapData['borderRightStyle'],
        borderRightColor: mapData['borderRightColor'],
        borderRightWidth: mapData['borderRightWidth'],
        borderTopStyle: mapData['borderTopStyle'],
        borderTopColor: mapData['borderTopColor'],
        borderTopWidth: mapData['borderTopWidth'],
        borderBottomStyle: mapData['borderBottomStyle'],
        borderBottomColor: mapData['borderBottomColor'],
        borderBottomWidth: mapData['borderBottomWidth'],
        borderTopLeftRadius: mapData['borderTopLeftRadius'],
        borderTopRightRadius: mapData['borderTopRightRadius'],
        overflowY: mapData['overflowY'],
        overflowX: mapData['overflowX'],
        letterSpacing: mapData['letterSpacing'],
        transform: mapData['transform'],
        backgroundSize: mapData['backgroundSize'],
        margin: mapData['margin'],
        padding: mapData['padding'],
        elevation: mapData['elevation'],
        zIndex: mapData['zIndex'],
        gridCount: mapData['gridCount'],
        gridMainAxisSpacing: mapData['gridMainAxisSpacing'],
        gridCrossAxisSpacing: mapData['gridCrossAxisSpacing'],
        gridChildAspectRatio: mapData['gridChildAspectRatio']);
  }
}
