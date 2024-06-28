using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeTexture : MonoBehaviour
{
    // 텍스처를 저장할 변수
    public Texture[] textures;
    public Material material;
    public GameObject button;

    private int currentTextureIndex = 0;

    void Start()
    {
        // GameObject에 부착된 Renderer 컴포넌트로부터 Material을 가져옴
        Renderer renderer = GetComponent<Renderer>();
        if (renderer != null)
        {
            material = renderer.material;
        }

        // 초기 텍스처를 설정
        if (material != null && textures.Length > 0)
        {
            material.mainTexture = textures[currentTextureIndex];
        }
    }


    void Update()
    {
        // 키보드 입력을 감지하여 텍스처 변경
        if (Input.GetKeyDown(KeyCode.Space))
        {
            ChangeTextureOnClick();
        }
    }

    public void ChangeTextureOnClick()
    {
        currentTextureIndex = (currentTextureIndex + 1) % textures.Length;

        if (material != null)
        {
            material.mainTexture = textures[currentTextureIndex];
            Debug.Log("Texture changed to index: " + currentTextureIndex);
        }
    }
}