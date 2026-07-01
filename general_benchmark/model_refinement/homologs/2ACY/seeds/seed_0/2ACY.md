# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\2ACY\seeds\seed_0\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 1.694 A
- tm_score_ca_ordered: 0.8576001415781542
- heavy_atom_rmsd: 3.725 A
- sidechain_heavy_atom_rmsd: 4.802 A
- **all-atom quality (honest):** heavy 3.725 A, sidechain 4.802 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 3926
- bin_accuracy: 0.857

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.6941251986504624
- ga_delta_rmsd: 0.233771490575293  ga_fitness_mode: energy
- pre_local_rmsd: 1.7039879292990938  localized_anchor_rmsd: 1.6940779012196499

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E1 → 89 conflicts (82%)
- explained: 89/108 conflicts by 1 root cause(s)
- metrics: hubs=28 (frac 0.292), conflicts/hub=3.9, max_incompat=5.41Å, chain_span=0.76
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E1 — explain ~89/108 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E65** — severity 15.71, 14 conflict(s); suspect input ~`Q61` (group: push_out)
  - push-out (wants farther): E1@26.9Å(now 21.5,conf 0.81), G2@25.6Å(now 22.8,conf 0.63)
  - E1↔E62: targets 26.9/6.1Å but partners are 16.1Å apart → too_close_together by 4.6Å
  - E1↔Q61: targets 26.9/6.6Å but partners are 15.6Å apart → too_close_together by 4.6Å
  - E1↔R58: targets 26.9/11.8Å but partners are 10.2Å apart → too_close_together by 4.9Å
- **L64** — severity 10.89, 7 conflict(s); suspect input ~`M60` (group: push_out)
  - push-out (wants farther): E1@25.8Å(now 20.4,conf 0.65)
  - E1↔M60: targets 25.8/6.3Å but partners are 14.6Å apart → too_close_together by 4.8Å
  - E1↔H59: targets 25.8/8.8Å but partners are 11.9Å apart → too_close_together by 5.0Å
  - E1↔R58: targets 25.8/10.9Å but partners are 10.2Å apart → too_close_together by 4.7Å
- **T66** — severity 10.02, 9 conflict(s); suspect input ~`E62` (group: push_out)
  - push-out (wants farther): E1@27.1Å(now 22.2,conf 0.87)
  - E1↔E62: targets 27.1/6.6Å but partners are 16.1Å apart → too_close_together by 4.4Å
  - E1↔W63: targets 27.1/5.7Å but partners are 17.9Å apart → too_close_together by 3.5Å
  - E1↔H59: targets 27.1/10.9Å but partners are 11.9Å apart → too_close_together by 4.3Å
- **E62** — severity 9.55, 8 conflict(s); suspect input ~`R58` (group: push_out)
  - push-out (wants farther): E1@22.5Å(now 16.1,conf 0.48), G2@21.0Å(now 18.0,conf 0.43)
  - E1↔H59: targets 22.5/5.7Å but partners are 11.9Å apart → too_close_together by 4.9Å
  - E1↔R58: targets 22.5/7.0Å but partners are 10.2Å apart → too_close_together by 5.3Å
  - E1↔S55: targets 22.5/11.9Å but partners are 6.3Å apart → too_close_together by 4.3Å
- **Q61** — severity 8.68, 7 conflict(s); suspect input ~`S55` (group: push_out)
  - push-out (wants farther): E1@21.6Å(now 15.6,conf 0.45), G2@19.7Å(now 16.6,conf 0.40)
  - E1↔R58: targets 21.6/6.0Å but partners are 10.2Å apart → too_close_together by 5.4Å
  - E1↔S55: targets 21.6/10.7Å but partners are 6.3Å apart → too_close_together by 4.6Å
  - E1↔V57: targets 21.6/6.3Å but partners are 11.5Å apart → too_close_together by 3.8Å
- **W63** — severity 8.54, 6 conflict(s); suspect input ~`H59` (group: push_out)
  - push-out (wants farther): E1@23.6Å(now 17.9,conf 0.51)
  - E1↔H59: targets 23.6/6.4Å but partners are 11.9Å apart → too_close_together by 5.3Å
  - E1↔M60: targets 23.6/5.5Å but partners are 14.6Å apart → too_close_together by 3.5Å
  - E1↔R58: targets 23.6/9.0Å but partners are 10.2Å apart → too_close_together by 4.4Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=39 · 3-10(G)=14 · coil(C)=12

```
EHEECGEEEEEGGEHHEHEHHHHHEHGHHHHHGEEEECEEECHEEGGGCGEECHHHHHHHHHEHHGEEEHHEGGHEGECEHCECECECGECECEEE
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=15 · sheet=24
  - V16 ↔ F20  (helix)
  - G18 ↔ R22  (helix)
  - F20 ↔ Y24  (helix)
  - R22 ↔ Q26  (helix)
  - Y24 ↔ E28  (helix)
  - Q26 ↔ K30  (helix)
  - E28 ↔ L32  (helix)
  - A54 ↔ R58  (helix)
  - S55 ↔ H59  (helix)
  - K56 ↔ M60  (helix)
  - V57 ↔ Q61  (helix)
  - R58 ↔ E62  (helix)
  - M60 ↔ L64  (helix)
  - Q61 ↔ E65  (helix)
  - K71 ↔ D75  (helix)
  - E11 ↔ Q17  (sheet)
  - G14 ↔ V19  (sheet)
  - V19 ↔ T25  (sheet)
  - V19 ↔ Q39  (sheet)
  - T25 ↔ L34  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=29 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=346 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=181 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9475 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
