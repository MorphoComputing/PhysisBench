# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1FKF\seeds\seed_1\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 2.058 A
- tm_score_ca_ordered: 0.8742384067322655
- heavy_atom_rmsd: 3.478 A
- sidechain_heavy_atom_rmsd: 4.310 A
- **all-atom quality (honest):** heavy 3.478 A, sidechain 4.310 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 3422
- bin_accuracy: 0.821

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=1.7024733730511374 -> 1.5223318410221782 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.0582457795509077
- ga_delta_rmsd: -0.5932348171434427  ga_fitness_mode: energy
- pre_local_rmsd: 2.060765285964787  localized_anchor_rmsd: 2.0582589087116054

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P77-T84 → 100 conflicts (74%); V1 → 10 conflicts (7%); P87-G88 → 8 conflicts (6%)
- explained: 118/135 conflicts by 3 root cause(s)
- metrics: hubs=24 (frac 0.229), conflicts/hub=5.6, max_incompat=5.48Å, chain_span=0.857
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P77-T84 + V1 + P87-G88 — explain ~118/135 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V1** — severity 13.16, 15 conflict(s); suspect input ~`Q64` (group: push_out)
  - push-out (wants farther): D10@20.8Å(now 15.8,conf 0.43), R12@20.6Å(now 15.5,conf 0.42), T13@19.8Å(now 17.2,conf 0.40), G11@19.3Å(now 15.3,conf 0.39), P92@17.5Å(now 13.2,conf 0.36), A83@16.8Å(now 13.5,conf 0.35)
  - P92↔P77: targets 17.5/9.7Å but partners are 3.7Å apart → too_close_together by 4.1Å
  - S76↔P92: targets 6.5/17.5Å but partners are 7.1Å apart → too_close_together by 3.9Å
  - R12↔Q64: targets 20.6/10.3Å but partners are 6.5Å apart → too_close_together by 3.8Å
- **G57** — severity 11.73, 13 conflict(s); suspect input ~`T84` (group: push_out)
  - push-out (wants farther): P91@16.8Å(now 13.6,conf 0.35), P92@16.2Å(now 12.2,conf 0.35), T84@15.8Å(now 10.9,conf 0.34), A83@15.0Å(now 11.7,conf 0.34)
  - Y79↔T84: targets 5.3/15.8Å but partners are 6.8Å apart → too_close_together by 3.8Å
  - P92↔P77: targets 16.2/8.9Å but partners are 3.7Å apart → too_close_together by 3.6Å
  - A80↔T84: targets 6.4/15.8Å but partners are 5.9Å apart → too_close_together by 3.5Å
- **R56** — severity 10.52, 12 conflict(s); suspect input ~`T84` (group: push_out)
  - push-out (wants farther): P91@17.9Å(now 14.5,conf 0.36), P92@17.0Å(now 13.2,conf 0.35), T84@15.5Å(now 10.1,conf 0.34), A83@15.2Å(now 11.5,conf 0.34)
  - Y79↔T84: targets 5.8/15.5Å but partners are 6.8Å apart → too_close_together by 3.0Å
  - A80↔P91: targets 6.9/17.9Å but partners are 8.1Å apart → too_close_together by 2.8Å
  - P92↔P77: targets 17.0/10.4Å but partners are 3.7Å apart → too_close_together by 2.9Å
- **D78** — severity 9.61, 9 conflict(s); suspect input ~`G88` (group: push_out)
  - push-out (wants farther): G88@18.4Å(now 11.7,conf 0.37), A83@7.8Å(now 3.8,conf 0.35), I89@16.5Å(now 12.9,conf 0.35), P87@16.4Å(now 9.2,conf 0.35), T84@9.9Å(now 3.9,conf 0.34), G85@10.2Å(now 7.0,conf 0.34), P92@10.5Å(now 5.5,conf 0.34), P91@12.8Å(now 8.3,conf 0.34)
  - Y81↔G88: targets 6.7/18.4Å but partners are 6.4Å apart → too_close_together by 5.3Å
  - Y81↔P87: targets 6.7/16.4Å but partners are 4.3Å apart → too_close_together by 5.5Å
  - G82↔G88: targets 5.2/18.4Å but partners are 9.8Å apart → too_close_together by 3.4Å
- **S76** — severity 8.04, 7 conflict(s); suspect input ~`Y81` (group: push_out)
  - push-out (wants farther): G88@18.9Å(now 14.9,conf 0.38), P87@17.9Å(now 13.3,conf 0.36), A83@11.0Å(now 8.3,conf 0.34), T84@13.1Å(now 9.4,conf 0.34), P91@12.9Å(now 9.4,conf 0.34), P92@11.7Å(now 7.1,conf 0.34)
  - P87↔Y81: targets 17.9/9.0Å but partners are 4.3Å apart → too_close_together by 4.7Å
  - A80↔P87: targets 6.6/17.9Å but partners are 7.0Å apart → too_close_together by 4.3Å
  - G88↔Y81: targets 18.9/9.0Å but partners are 6.4Å apart → too_close_together by 3.5Å
- **W58** — severity 7.67, 10 conflict(s); suspect input ~`A80` (group: push_out)
  - push-out (wants farther): P92@17.9Å(now 14.7,conf 0.36), P91@17.8Å(now 15.1,conf 0.36), T84@17.5Å(now 13.3,conf 0.36), A83@17.4Å(now 14.7,conf 0.36)
  - T84↔A80: targets 17.5/8.1Å but partners are 5.9Å apart → too_close_together by 3.5Å
  - T84↔Y79: targets 17.5/8.1Å but partners are 6.8Å apart → too_close_together by 2.7Å
  - P92↔P77: targets 17.9/11.6Å but partners are 3.7Å apart → too_close_together by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=37 · 3-10(G)=27 · coil(C)=12

```
CEEGEHEGHEECEEEECHEGGCEGEECEGHHHEGHEEHHHGGECGGEEEGGHEECGHHHHHHHHEEGHEGECGGGGCHHEHEHHHHEECEECHEGGGGGEGGHEC
```

## Backbone H-bond Network

- total=49 · helix(i→i+4)=9 · sheet=40
  - D31 ↔ F35  (helix)
  - F35 ↔ R39  (helix)
  - G57 ↔ G61  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - E60 ↔ Q64  (helix)
  - Q64 ↔ G68  (helix)
  - Y79 ↔ A83  (helix)
  - Y81 ↔ G85  (helix)
  - V3 ↔ D10  (sheet)
  - V3 ↔ G11  (sheet)
  - T5 ↔ D10  (sheet)
  - T5 ↔ G11  (sheet)
  - D10 ↔ P15  (sheet)
  - T13 ↔ Q19  (sheet)
  - F14 ↔ Q19  (sheet)
  - P15 ↔ V23  (sheet)
  - V23 ↔ S37  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - … +29 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=53 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=446 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=262 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0348 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
