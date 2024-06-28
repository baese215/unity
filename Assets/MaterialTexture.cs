using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MaterialTexture : MonoBehaviour
{
    public MeshRenderer targetRenderer; // 변경할 material을 가진 Renderer
    private int currentMaterialIndex = 0; // 현재 material 인덱스
    public Material[] materials; // 변경할 Material 배열

    void Start()
    {
        // 초기 material 설정
        if (targetRenderer != null && materials.Length > 0)
        {
            targetRenderer.material = materials[currentMaterialIndex];
        }
    }

    void Update()
    {
        // "T" 키를 누르면 material 변경
        if (Input.GetKeyDown(KeyCode.T))
        {
            SwitchMaterial();
        }
    }

    void SwitchMaterial()
    {
        // 다음 material의 인덱스 계산
        currentMaterialIndex = (currentMaterialIndex + 1) % materials.Length;

        // material 변경
        if (targetRenderer != null && materials.Length > 0)
        {
            targetRenderer.material = materials[currentMaterialIndex];
        }
    }
}
