# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\2CRD\seeds\seed_0\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 0.057 A
- tm_score_ca_ordered: 0.9985765265529636
- heavy_atom_rmsd: 2.550 A
- sidechain_heavy_atom_rmsd: 3.286 A
- **all-atom quality (honest):** heavy 2.550 A, sidechain 3.286 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 248
- bin_accuracy: 0.984

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain_block reason=accepted tested=24
- rigid_domain_reconvergence: applied=True accepted=3 rmsd=0.307834419575447 -> 0.2625798768758458 A
- topology_reconvergence: applied=True accepted=28/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.05705276868207615
- ga_delta_rmsd: -0.06609644736348397  ga_fitness_mode: energy
- pre_local_rmsd: 0.057039110181274  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=12 · 3-10(G)=10 · coil(C)=3

```
EEEEGGEHHGHGHHHHGGEHEGCCEEGHGECGEE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=3 · sheet=12
  - K9 ↔ S13  (helix)
  - C11 ↔ C15  (helix)
  - Q16 ↔ N20  (helix)
  - T1 ↔ H19  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ C26  (sheet)
  - H19 ↔ C33  (sheet)
  - H19 ↔ Y34  (sheet)
  - T21 ↔ C33  (sheet)
  - T21 ↔ Y34  (sheet)
  - K25 ↔ K30  (sheet)
  - K25 ↔ C33  (sheet)
  - K25 ↔ Y34  (sheet)
  - C26 ↔ C33  (sheet)
  - C26 ↔ Y34  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=127 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=62 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7106 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2CRD.ensemble.pdb`)
- RMSF mean=0.023Å max=0.051Å (per-residue in .per_residue.csv)
- most flexible residues: 5, 21, 20, 10, 24

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2CRD.pae.csv`
- mean=0.016Å · max=0.055Å · AlphaFold-PAE analog (low block = rigid unit/domain)
