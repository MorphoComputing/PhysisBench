# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2CRD\seeds\seed_1\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.851 A
- tm_score_ca_ordered: 0.45644198807008995
- heavy_atom_rmsd: 4.372 A
- sidechain_heavy_atom_rmsd: 5.263 A
- **all-atom quality (honest):** heavy 4.372 A, sidechain 5.263 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 215
- bin_accuracy: 0.660

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=14 rmsd=3.7524702468549256 -> 2.9416017627834545 A
- topology_reconvergence: applied=True accepted=5/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.8508768646113634
- ga_delta_rmsd: -0.6050612064565173  ga_fitness_mode: energy
- pre_local_rmsd: 2.8508445213933333  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.059), conflicts/hub=1.0, max_incompat=3.29Å, chain_span=0.529
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C26** — severity 1.79, 1 conflict(s); suspect input ~`N2` (group: push_out)
  - push-out (wants farther): N2@11.2Å(now 5.3,conf 0.55), V3@9.4Å(now 4.3,conf 0.55)
  - C31↔N2: targets 4.1/11.2Å but partners are 3.8Å apart → too_close_together by 3.3Å
- **S8** — severity 1.11, 1 conflict(s); suspect input ~`M27` (group: push_out)
  - pull-in (wants closer): M27@9.2Å(now 11.8,conf 0.55), K30@10.2Å(now 13.7,conf 0.55)
  - push-out (wants farther): T1@13.2Å(now 10.3,conf 0.55)
  - N2↔M27: targets 15.0/9.2Å but partners are 3.8Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=18 · 3-10(G)=4 · coil(C)=1

```
EEEGEHHHHHHEHEHHEHEHEGECEEEGEEEGEE
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=4 · sheet=43
  - T6 ↔ E10  (helix)
  - T7 ↔ C11  (helix)
  - C11 ↔ C15  (helix)
  - Q16 ↔ N20  (helix)
  - T1 ↔ W12  (sheet)
  - T1 ↔ V14  (sheet)
  - T1 ↔ R17  (sheet)
  - T1 ↔ H19  (sheet)
  - V3 ↔ W12  (sheet)
  - V3 ↔ V14  (sheet)
  - C5 ↔ W12  (sheet)
  - C5 ↔ V14  (sheet)
  - C5 ↔ K25  (sheet)
  - W12 ↔ R17  (sheet)
  - W12 ↔ H19  (sheet)
  - W12 ↔ T21  (sheet)
  - W12 ↔ R23  (sheet)
  - W12 ↔ K25  (sheet)
  - W12 ↔ C26  (sheet)
  - W12 ↔ C31  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=147 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=82 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9331 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
