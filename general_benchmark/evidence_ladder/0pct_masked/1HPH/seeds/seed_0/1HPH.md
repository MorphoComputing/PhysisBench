# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1HPH/sequence/1HPH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1HPH/seeds/seed_0/1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 0.891 A
- tm_score_ca_ordered: 0.8934278022910962
- heavy_atom_rmsd: 2.822 A
- sidechain_heavy_atom_rmsd: 3.552 A
- **all-atom quality (honest):** heavy 2.822 A, sidechain 3.552 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 528
- bin_accuracy: 0.953

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=33
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=1.3496510885537285 -> 1.1869662400118783 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8908892068115691
- ga_delta_rmsd: 0.2735834693861259  ga_fitness_mode: energy
- pre_local_rmsd: 0.8909211619038429  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=6 · 3-10(G)=4 · coil(C)=3

```
CEHHHHHHHEEHGCEGHHHHHHHHHHHHHHGCGEE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=12 · sheet=2
  - E3 ↔ M7  (helix)
  - Q5 ↔ N9  (helix)
  - H8 ↔ K12  (helix)
  - M17 ↔ E21  (helix)
  - E18 ↔ W22  (helix)
  - R19 ↔ L23  (helix)
  - V20 ↔ R24  (helix)
  - E21 ↔ K25  (helix)
  - W22 ↔ K26  (helix)
  - L23 ↔ L27  (helix)
  - R24 ↔ Q28  (helix)
  - K26 ↔ V30  (helix)
  - S2 ↔ L10  (sheet)
  - L10 ↔ N15  (sheet)

## Solvent Accessibility (burial)

- buried=16 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=87 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=3 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5798 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
