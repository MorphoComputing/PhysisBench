# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1ENH\seeds\seed_1\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 0.884 A
- tm_score_ca_ordered: 0.9266762723373039
- heavy_atom_rmsd: 3.273 A
- sidechain_heavy_atom_rmsd: 4.144 A
- **all-atom quality (honest):** heavy 3.273 A, sidechain 4.144 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1178
- bin_accuracy: 0.868

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=0.9886435412927953 -> 0.8599382121945227 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8836231916602996
- ga_delta_rmsd: -0.09835053627473467  ga_fitness_mode: energy
- pre_local_rmsd: 0.9269702158587434  localized_anchor_rmsd: 0.8836069248078935

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=8 · 3-10(G)=8 · coil(C)=0

```
EEEGEGHHHHHHHHHHHHGEHEGGGHHHHHHHHHGHEHHHHHHHHHHGHHHE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=24 · sheet=0
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - Q9 ↔ L13  (helix)
  - L10 ↔ K14  (helix)
  - A11 ↔ R15  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - K14 ↔ N18  (helix)
  - F17 ↔ R21  (helix)
  - R26 ↔ Q30  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - Q29 ↔ S33  (helix)
  - Q30 ↔ E34  (helix)
  - S32 ↔ G36  (helix)
  - G36 ↔ A40  (helix)
  - E39 ↔ K43  (helix)
  - A40 ↔ I44  (helix)
  - Q41 ↔ W45  (helix)
  - I42 ↔ F46  (helix)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=146 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=17 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1275 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
